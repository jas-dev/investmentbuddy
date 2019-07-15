import React from 'react';


export default ({symbol, date, performance,price, goToDetails}) => {

    return (
        <li className="collection-item product-item hoverable" onClick={() => { goToDetails()}}>
            <p className="title">{symbol}</p>
            <div className='row center'>

                <div className="col s4">
                    <span>Last Updated: {date}</span>
                </div>
                <div className="col s4">
                    <span>Gain/Loss: {performance} </span>
                </div>
                <div className="col s4">
                    <span>Price: {price} </span>
                </div>
            </div>

        </li>
    );
}