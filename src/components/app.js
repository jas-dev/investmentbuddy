import 'materialize-css/dist/css/materialize.min.css';
import 'materialize-css/dist/js/materialize.min';
import '../assets/css/app.scss';
import React from 'react';
import {Route} from 'react-router-dom';
import Home from './pages/home/home';
import About from './pages/about';
import StocksDetails from './stocks_details/stocks_details';
import Portfolio from './pages/portfolio/portfolio';
import Faq from './pages/faq/faq';
import SignUp from './pages/sign_up/sign_up'
import SignIn from './pages/sign_in/sign_in';
import Nav from './nav'

const App = () => (
    <div>
        <Nav/>
        <Route path="/home" exact component={Home}/>
        <Route path="/about" exact component={About}/>
        <Route path="/stocksdetails" exact component={StocksDetails}/>
        <Route path="/portfolio" exact component={Portfolio}/>
        <Route path="/faq" exact component={Faq}/>
        <Route path="/sign-in" exact component={SignIn}/>
        <Route path="/sign-up" exact component={SignUp}/>
    </div>
);

export default App;
