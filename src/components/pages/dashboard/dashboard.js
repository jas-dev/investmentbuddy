import React from 'react';
import Portfolio from '../portfolio/portfolio';
import Transactions from '../transactions/transactions';
import Watchlist from "../../stock_watchlist/stock_watch";
import EnterTrades from '../enter_trades/enter_trades';
import Ticker from '../../ticker';

export default props =>{
    return (
        <div className='dashboard-wrapper'>
            <div className='ticker-container'>
                <Ticker/>
            </div>
            <div className='container'>
                <h1>Dashboard</h1>
            </div>
            <div className=''>
                <Portfolio/>
            </div>
            <div>
                <EnterTrades/>
            </div>
            <div className=''>
                <Watchlist history={props.history}/>
            </div>
            <div id='transactions'>
                <Transactions/>
            </div>
        </div>
    )
}