import 'materialize-css/dist/css/materialize.min.css';
import 'materialize-css/dist/js/materialize.min';
import '../assets/css/app.scss';
import React from 'react';
import {Route} from 'react-router-dom';
import Landing from './pages/landing/landing';
import About from './pages/about';
import StocksDetails from './stocks_details/stocks_details';
import Portfolio from './pages/portfolio/portfolio';
import Faq from './pages/faq/faq';

const App = () => (
    <div>
        <div className='app'>
            <Route path="/landing" component={Landing}/>
            <Route path="/about" component={About}/>
            <Route path="/stocksdetails" component={StocksDetails}/>
            <Route path="/portfolio" component={Portfolio}/>
            <Route path="/faq" component={Faq}/>
        </div>
    </div>
);

export default App;
