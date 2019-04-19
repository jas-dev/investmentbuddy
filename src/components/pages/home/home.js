import React from 'react';
import Nav from '../../nav';
import About from '../about/about';
import StocksDetails from '../../stocks_details/stocks_details';
import Portfolio from '../portfolio/portfolio';
import Faq from '../faq/faq';
import Logo from "../../../assets/images/moneybag.png";


export default props =>{

    return (
        <div>

            <About/>
            <StocksDetails/>
            <Portfolio/>
            <Faq/>
        </div>
    )
}