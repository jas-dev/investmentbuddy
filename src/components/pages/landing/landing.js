import React from 'react';
import Nav from '../../nav';
import About from '../../about'
import Usd from "../../../assets/images/usdcoin.png";

export default props =>{
    return (
        <div>
            <Nav/>
            <img className='center' src={Usd}/>
            <h1 className='center green-text text-darken-2'>Investment Buddy</h1>
            <About/>
            <h2 className='center green-text text-darken-2'>See current stock data</h2>
            <h2 className='center green-text text-darken-2'>Manage a Portfolio</h2>
            <h2 className='center green-text text-darken-2'>FAQ</h2>

        </div>
    )
}