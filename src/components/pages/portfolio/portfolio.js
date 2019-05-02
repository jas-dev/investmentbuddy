import React, {Component} from 'react';
import axios from 'axios';
import AddFunds from './add_funds/add_funds';
import Stock_chart from '../../chart/stock_chart';
import AccountInfo from '../../account/account_info';
import OpenTrades from '../../helpers/open_trades';
import OffsetTrades from '../../helpers/offset_trades';
import './portfolio.scss';

import {connect} from 'react-redux';

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

    render(){
        if(!this.state.offsetTrades.length || !this.state.openTrades.length || !this.state.accountData.length){
            return null;
        }
        
        return (
            <div className='portfolio-wrapper container'>

                <h5 className=''>Manage your portfolio</h5>

                <div className='row card center'>
                    <div className='col s12'>
                        <Stock_chart/>
                    </div>
                </div>

                <div className="row card card-padout">
                    <div className="col s6">
                        <AccountInfo accountData={this.state.accountData}/>
                    </div>

                    <div className="col s6 ">
                        <AddFunds handler={this.handleAddFunds}/>
                    </div>
                </div>

                <div className="col s12">
                    <OpenTrades openTrades={this.state.openTrades}/>
                    <OffsetTrades offsetTrades={this.state.offsetTrades}/>
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

