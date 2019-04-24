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

                    <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime minus nostrum quas? Fuga iusto libero molestias nihil odio quod repellat tenetur voluptas. Dignissimos eos id molestiae nisi obcaecati praesentium unde?</span><span>Architecto aut doloremque earum enim fugit id inventore maiores natus odit pariatur perspiciatis placeat quam quas quod reprehenderit soluta ullam, voluptate! Aliquam aut debitis impedit inventore, iste reiciendis voluptate voluptates?</span>

            </div>
        </div>
    )
}