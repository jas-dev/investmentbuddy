import React from 'react';
import Portfolio from '../portfolio/portfolio'
import Transactions from '../transactions/transactions'
import Watchlist from "../../stock_watchlist/stock_watch";

export default props =>{
    return (
        <div className='dashboard-wrapper'>
            <div className='container'>
                <h4>Dashboard</h4>
            </div>

            <div className='divider'/>
            <div className=''>
                <Portfolio/>
            </div>
            <div className='divider'/>
            <div className=''>
                <Watchlist/>
            </div>
            <div className='divider'/>
            <div className=''>
                <Transactions/>
            </div>
        </div>
    )
}