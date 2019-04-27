import React from 'react';
import './about.scss'
import Logo from '../../../assets/images/usdcoin.png'


export default props =>{
    return (
        <div className='about-wrapper container'>
            <div className='brand-logo center'>
                <img src={Logo}/>
            </div>


            <h5 className='center'>Investment Buddy</h5>
            <div className='about-text card'>
                <div className='divider'/>

                    <span>Welcome to Investment Buddy! We retrieve live stock prices and historical data so you can make better trading decisions! Simulate trades with your available funds and watch your profits rise!</span>

            </div>
        </div>
    )
}