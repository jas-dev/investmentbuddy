import React, {Component, Fragment} from 'react';
import axios from 'axios';
import StockListing from '../pages/all_stocks/stock_listing';

export default props =>{
    
    const stockList = this.state.stocks.map(stocks => {
        return(
            <StockListing key={stocks.symbol} {...stocks} goToDetails={this.goToDetails}/>
        )
    });


    return(
        <Fragment>
            <ul className="collection card">
                {stockList}
            </ul>
        </Fragment>
    )

}


