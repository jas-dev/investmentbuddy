import React from 'react';
import './ticker.scss';
import {randomizeStocks} from "../helpers"

export default props =>{
    let randomStocks = randomizeStocks(props.stocks);
    let tickerStocks = randomStocks.map((stock, index)=>{
        return (
            <div key={index} className="ticker__item" onClick={props.details}>{`${stock.symbol} | $${stock.price}, Percentage Change: ${stock.percentChange}%          `}</div>
        )
    });

    return(
        <div className="ticker-wrap">
            <div className="ticker">
                {tickerStocks}
            </div>
        </div>
    )

}

