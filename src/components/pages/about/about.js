import React from 'react';
import './about.scss'
import Logo from '../../../assets/images/usdcoin.png'


export default props =>{
    return (
        <div className='about-wrapper'>
            <div className='brand-logo center'>
                <img src={Logo}/>
            </div>

            <div className='about-text'>
                <h5 className='center'>Learn how to invest in stocks</h5>
                <div className='divider'/>
                <p>
                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime minus nostrum quas? Fuga iusto libero molestias nihil odio quod repellat tenetur voluptas. Dignissimos eos id molestiae nisi obcaecati praesentium unde?</span><span>Architecto aut doloremque earum enim fugit id inventore maiores natus odit pariatur perspiciatis placeat quam quas quod reprehenderit soluta ullam, voluptate! Aliquam aut debitis impedit inventore, iste reiciendis voluptate voluptates?</span>
                </p>
            </div>
        </div>
    )
}