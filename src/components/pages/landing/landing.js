import React from 'react';
import Nav from '../../nav';
import About from '../about/about';
import StocksDetails from '../../stocks_details/stocks_details';
import Portfolio from '../portfolio/portfolio';
import Faq from '../faq/faq';

import Usd from "../../../assets/images/usdcoin.png";

export default props =>{
    console.log('landing props:',props);
    return (
        <div>
            <Nav/>

            <div className='center'>
                <img src={Usd}/>
            </div>

            <h1 className='center green-text text-darken-2'>Investment Buddy</h1>

            <About/>
            <StocksDetails/>
            <Portfolio/>
            <Faq/>


        </div>
    )
}