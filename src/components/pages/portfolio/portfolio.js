import React, {Component} from 'react';
import axios from 'axios';
import AddFunds from './add_funds/add_funds';
import AccountInfo from '../../account/account_info';
import OpenTrades from '../../helpers/open_trades';
import OffsetTrades from '../../helpers/offset_trades';
import './portfolio.scss';

import {connect} from 'react-redux';
import EnterTradesForm from "../../enter_trades/enter_trades_form";
import Loader from '../../loader';
import Transactions from "../transactions";

class Portfolio extends Component{
    constructor(props){
        super(props);
        this.state = {
            offsetTrades: [],
            openTrades: [],
            accountData:[]
        };
    }

    componentDidMount() {
        this.getStockData();
        this.getAccountData();
    }

    getStockData(){
        axios.get('/api/getportfoliodata.php').then(resp => {
            
            this.setState({
                offsetTrades: resp.data.offsetTrades,
                openTrades: resp.data.openTrades
            });

        });

    }

    getAccountData() {
        axios.get('/api/getaccountbalance.php').then(resp => {
    
        let newArray = [resp.data];
            this.setState({
                accountData: newArray
            });
        });
    }

    handleAddFunds = inputs => {
        const {amount} = inputs;
        if (amount > 0) {
            axios.get(`/api/addfunds.php?amount=${amount}`).then(resp => {

                let toastMessage = '';
                const {message, success, error} = resp.data;
                if (message) {
                    toastMessage = message;
                    this.getAccountData();
                } else {
                    toastMessage = error ? error : 'Could not connect to database, try again later.'
                }

                M.toast({html: toastMessage});
            });
        } else {
            M.toast({html: 'Please choose a positive number.'});
        }
    }

    submitTrade = async inputs => {
        const {symbol, buy_sell, shares, price} = inputs;
        const resp = await axios.get(`/api/addtransaction.php?symbol=${symbol}&buy_sell=${buy_sell}&shares=${shares}&price=${price}`);

        let toastMessage = '';
        const {message, error, success} = resp.data;

        if (message) {
            toastMessage = message;
            this.getStockData();
            this.getAccountData()
        } else {
            toastMessage = error ? error : 'Could not connect to database, try again later.';
        }

        M.toast({html: toastMessage});
    };

    render(){
        if(!this.state.offsetTrades.length && !this.state.openTrades.length && !this.state.accountData.length){
            return <Loader/>;
        }
        
        return (
            <div className='portfolio-wrapper container'>

                <h5 className=''>Manage your portfolio</h5>

                <div className="row card card-padout">
                    <div className="col s11">
                        <AccountInfo accountData={this.state.accountData}/>
                    </div>
                </div>

                <div className='row'>

                    <div className="col s6 card card-padout">
                        <h6>Enter Trades</h6>
                        <EnterTradesForm handler={this.submitTrade}/>
                    </div>
                    <div className="col s5 card card-padout right">
                        <h6>Add Funds</h6>
                        <AddFunds handler={this.handleAddFunds}/>
                    </div>
                </div>


                <div className="col s12">
                    <OpenTrades openTrades={this.state.openTrades}/>
                    <OffsetTrades offsetTrades={this.state.offsetTrades}/>
                </div>

                <div className="col s12">
                    <Transactions/>
                </div>

            </div>
        )
    }
}

function mapStateToProps(state) {
    return {
        id: state.user.id
    };
}

export default connect(mapStateToProps)(Portfolio);

