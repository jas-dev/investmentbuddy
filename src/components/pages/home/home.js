import React from 'react';
import './home.scss'
import About from '../about/about';
import Faq from '../faq/faq';
import {nyseImg} from "../../../../public/dist/assets/images/NewYorkStockExchange.png";



export default props =>{
console.log("Home Props:", props);
    return (
            <div>

                <div className="parallax-container">
                    <div className="parallax">
                        <img src={nyseImg}/>
                    </div>
                </div>

                <div className="section white">
                    <div className="row container">
                        <About/>
                        <Faq/>
                    </div>
                </div>
                <div className="parallax-container">
                    <div className="parallax">
                        <img src="images/parallax2.jpg"/>
                    </div>
                </div>
            </div>
        )

}


