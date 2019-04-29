import React, {Component} from 'react';
import './home.scss'
import About from '../about/about';
import Faq from '../faq/faq';
import nyseImg from "../../../../public/dist/assets/images/NewYorkStockExchange.jpg";




class Home extends Component {
    componentDidMount() {
        document.querySelectorAll('.parallax');
        M.Parallax.init(this.parallax);
        M.Parallax.init(this.parallax2);
    }

    render() {
        console.log("Home Props:", this.props);
        return (
            <div>
                <div className="parallax-container">
                    <div id="parallax" className="parallax" ref={element=> {
                        this.parallax = element
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
                    <div id="parallax" className="parallax" ref={element=>{
                        this.parallax2 = element
                    }}>
                        <img src={nyseImg}/>
                    </div>
                </div>
            </div>
        )

    }
}

export default Home;

