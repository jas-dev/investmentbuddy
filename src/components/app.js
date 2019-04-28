import 'materialize-css/dist/css/materialize.min.css';
import 'materialize-css/dist/js/materialize.min';
import '../assets/css/app.scss';
import React from 'react';
import {Switch, Route} from 'react-router-dom';
import Home from './pages/home/home';
import About from './pages/about';
import StockDetails from './pages/stock_details/stock_details';
import Portfolio from './pages/portfolio/portfolio';
import Faq from './pages/faq/faq';
import SignUp from './pages/sign_up/sign_up'
import SignIn from './account/sign_in_form';
import Dashboard from './pages/dashboard/dashboard'
import AllStocks from './pages/all_stocks/all_stocks'
import Transactions from './pages/transactions/transactions'
import MakeTrades from './pages/make_trades/make_trades'
import Page404 from './pages/404/404';
import Nav from './nav'
import Ticker from './ticker'

const App = () => (
    <div>
            <Nav/>
            <div>
                    <Ticker/>
            </div>

            <Switch>
                    <Route path="/home" component={Home}/>
                    <Route path="/about" component={About}/>
                    <Route path="/stockdetails/:symbol" render={(routingProps)=>{
                            return <StockDetails {...routingProps}/>
                    }}/>
                    <Route path="/portfolio" component={Portfolio}/>
                    <Route path="/faq" component={Faq}/>
                    <Route path="/sign-in" component={SignIn}/>
                    <Route path="/sign-up" component={SignUp}/>
                    <Route path="/dashboard" component={Dashboard}/>
                    <Route path="/stocks" component={AllStocks}/>
                    <Route path="/transactions" component={Transactions}/>
                    <Route path="/trade" component={MakeTrades}/>
                    <Route path="/" component={Home}/>
                    <Route component={Page404}/>
            </Switch>
    </div>
);

export default App;


