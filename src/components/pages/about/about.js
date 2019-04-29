import React from 'react';
import './about.scss'
import Logo from '../../../assets/images/moneytree.jpg'



export default props =>{
    return (
        <div className='about-wrapper container'>
            <h1 className='center'> About</h1>

            <div className='brand-logo center'>
                <img src={Logo}/>
            </div>

            <h5 className='center'>Investment Buddy</h5>
            <div className='about-text'>
                Welcome to Investment Buddy! We retrieve live stock prices and historical data so you can make better trading decisions! Simulate trades with your available funds and watch your profits rise!
            </div>
        </div>
    )
}

