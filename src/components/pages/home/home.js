import React from 'react';
import './home.scss'
import About from '../about/about';
import StocksDetails from '../stock_details/stock_details';
import Portfolio from '../portfolio/portfolio';
import Faq from '../faq/faq';



export default props =>{
console.log("Home Props:", props);
    return (
        <div className='body '>
            <div>
                <About/>
            </div>

            <div className=''>
                <StocksDetails/>
            </div>
            <div className=''>
                <Portfolio/>
            </div>
            <Faq/>
            <div className='footer'>
                <div className='divider'/>
            </div>
        </div>
    )
}

