import React, {Component} from 'react';
import axios from 'axios';
import AddFunds from './add_funds/add_funds';
import Stock_chart from '../../chart/stock_chart';
import AccountInfo from '../../account/account_info';
import OpenTrades from '../../helpers/open_trades';
import OffsetTrades from '../../helpers/offset_trades';
import './portfolio.scss';

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
        axios.get('/api/getportfoliodata.php').then(resp=>{
            console.log('response from portfolio call:', resp);
            this.setState({
                offsetTrades: resp.data.offsetTrades,
                openTrades: resp.data.openTrades
            })
        })
    }

    render(){
        if(!this.state.offsetTrades.length || !this.state.openTrades){
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

    handleAddFunds = inputs => {
        const {amount} = inputs;
        const account_id = 2;

        let message = '';
        axios.get(`/api/addfunds.php?account_id=${account_id}&amount=${amount}`).then(resp => {
            if (resp.data.message) {
                message = resp.data.message;
                this.getAccountData();
            } else {
                message = 'Could not connect to database, try again later.'
            }
            M.toast({
                html: message
            });
        });
    }

    getAccountData() {
        axios.get('/api/getaccountbalance.php').then(resp=>{
            this.setState({
                accountData: resp.data
            })
        });
    }
}

export default Portfolio;
