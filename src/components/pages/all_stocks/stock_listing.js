import React from 'react';


export default ({close, high, low, open, symbol, volume, goToDetails}) => {

    return (
        <li className="collection-item product-item hoverable" onClick={() => { goToDetails()}}>

            <div className='row'>
                <p className="title">{symbol}</p>
                <div className="col s2">
                    <span>High: {high}</span>
                </div>
                <div className="col s2">
                    <span>Low: {low} </span>
                </div>
                <div className="col s2">
                    <span>Open: {open} </span>
                </div>
                <div className="col s2">
                    <span>Close: {close} </span>
                </div>
                <div className="col s2">
                    <span>Volume: {volume} </span>
                </div>
            </div>

        </li>
    );
}