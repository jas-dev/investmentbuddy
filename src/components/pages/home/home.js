import React, {Component} from 'react';
import './home.scss'
import About from '../about/about';
import Faq from '../faq/faq';
import {nyseImg} from "../../../../public/dist/assets/images/NewYorkStockExchange.jpg";



class Home extends Component {
    componentDidMount() {
        const elems = document.querySelectorAll('.parallax');
        const instances = M.Parallax.init(elems);
    }

    render() {
        console.log("Home Props:", this.props);
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
                        <img src={nyseImg}/>
                    </div>
                </div>
            </div>
        )

    }
}

export default Home;

