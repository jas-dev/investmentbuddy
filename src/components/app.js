import 'materialize-css/dist/css/materialize.min.css';
import 'materialize-css/dist/js/materialize.min';
import '../assets/css/app.scss';
import React, {Component} from 'react';
import {Switch, Route} from 'react-router-dom';
import Home from './pages/home/home';
import About from './pages/about';
import StockDetails from './pages/stock_details/stock_details';
import Portfolio from './pages/portfolio/portfolio';
import Faq from './pages/faq/faq';
import SignIn from './pages/sign_in_page';
import Dashboard from './pages/dashboard/dashboard';
import AllStocks from './pages/all_stocks/all_stocks';
import Transactions from './pages/transactions/transactions';
import MakeTrades from './pages/enter_trades/enter_trades';
import Page404 from './pages/404/404';
import Nav from './nav';
import Ticker from './ticker';

class App extends Component {
    constructor(props){
        super(props);

        this.state = {
            signedIn: true
        }
    }

    render() {


        if(!!this.state.signedIn){
            return (
                <div>
                    <Nav/>
                    <div className='ticker-container'>
                        <Ticker/>
                    </div>

                    <Switch>
                        <Route path="/home" component={Home}/>
                        <Route path="/about" component={About}/>
                        <Route path="/stockdetails/:symbol" render={(routingProps) => {
                            return <StockDetails {...routingProps}/>
                        }}/>
                        <Route path="/portfolio" component={Portfolio}/>
                        <Route path="/faq" component={Faq}/>
                        <Route path="/sign-out" component={SignIn}/>
                        <Route path="/dashboard" component={Dashboard}/>
                        <Route path="/stocks" component={AllStocks}/>
                        <Route path="/transactions" component={Transactions}/>
                        <Route path="/trade" component={MakeTrades}/>
                        <Route path="/" component={Home}/>
                        <Route component={Page404}/>
                    </Switch>
                </div>
            );

        } else {
            return (
                <div>
                    <Nav/>
                    <div className='ticker-container'>
                        <Ticker/>
                    </div>
                    <Switch>
                        <Route path="/home" component={Home}/>
                        <Route path="/about" component={About}/>
                        <Route path="/faq" component={Faq}/>
                        <Route path="/sign-in" component={SignIn}/>
                        <Route path="/" component={Home}/>
                        <Route component={Page404}/>
                    </Switch>
                </div>
            );
        }

    }
}

export default App;


