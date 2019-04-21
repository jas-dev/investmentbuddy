import React from 'react';
import './home.scss'
import About from '../about/about';
import StocksDetails from '../stocks_details/stocks_details';
import Portfolio from '../portfolio/portfolio';
import Faq from '../faq/faq';



export default props =>{

    return (
        <div className='body'>
            <About/>
            <div className='hoverable container z-depth-1'>
                <StocksDetails/>
            </div>
            <div className='hoverable container z-depth-1'>
                <Portfolio/>
            </div>
            <Faq/>
            <div className='footer'>
                <h6> Just footer stuff</h6>
            </div>
        </div>
    )
}