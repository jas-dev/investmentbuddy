import React from 'react';
import Portfolio from '../portfolio/portfolio'
import Transactions from '../transactions/transactions'
import Watchlist from "../../stocks_watch";

export default props =>{
    return (
        <div className='dashboard-wrapper'>
            <h4>Dashboard</h4>
            <div className='hoverable'>
                <Portfolio/>
            </div>
            <div className='hoverable'>
                <Watchlist/>
            </div>
            <div className='hoverable'>
                <Transactions/>
            </div>
        </div>
    )
}