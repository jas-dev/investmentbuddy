import React from 'react';
import './ticker.scss'

export default props =>{
    console.log(props);
    let tickerStocks = props.stocks.map((stock, index)=>{
        return (
            <div key={index} className="ticker__item">{`${stock.symbol} | $${stock.price}, Percentage Change: ${stock.percentChange}%          `}</div>
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

