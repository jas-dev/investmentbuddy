import React from 'react';
import Portfolio from '../portfolio/portfolio'
import Transactions from '../transactions/transactions'
import Watchlist from "../../stocks_watch";

export default props =>{
    return (
        <div>
            <h1>Dashboard</h1>
            <Portfolio/>
            <Transactions/>
            <Watchlist/>


        </div>
    )
}