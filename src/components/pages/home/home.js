import React, {Component} from 'react';
import './home.scss'
import About from '../about/about';
import Faq from '../faq/faq';
import {nyseImg} from "../../../../public/dist/assets/images/NewYorkStockExchange.jpg";
import M from 'materialize-css';
import "materialize-css/dist/css/materialize.min.css";



class Home extends Component {
    componentDidMount() {

        this.parallax = document.querySelectorAll('.parallax');


        M.Parallax.init(this.parallax);

    }

    render() {
        console.log("Home Props:", this.props);
        return (
            <div>
                <div className="parallax-container">
                    <div id="parallax" className="parallax" ref={Parallax=>{
                        this.parallax = Parallax;
                    }}>
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
                    <div id="parallax" className="parallax" ref={Parallax=>{
                        this.parallax = Parallax;
                    }}>
                        <img src={nyseImg}/>
                    </div>
                </div>
            </div>
        )

    }
}

export default Home;

