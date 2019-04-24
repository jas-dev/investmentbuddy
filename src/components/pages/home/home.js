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
            <div className='divider'/>
            <div className='container'>
                <StocksDetails/>
            </div>
            <div className='container '>
                <Portfolio/>
            </div>
            <Faq/>
            <div className='footer'>
                <div className='divider z-depth-1'/>
                <h6> Just footer stuff</h6>
            </div>
        </div>
    )
}