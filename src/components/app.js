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
import Dashboard from './pages/dashboard/dashboard';
import BrowseStocks from './pages/browse_stocks/browse_stocks';
import Transactions from './pages/transactions/transactions';
import NotFound from './pages/404/404';
import Nav from './nav';
import AccountRoutes from './account';
import auth from '../hoc/auth';


class App extends Component {


    render() {

        return (
            <div>
                <Nav/>
                <Switch>
                    <Route path="/home" component={Home}/>
                    <Route path="/about" component={About}/>
                    <Route path="/stockdetails/:symbol" render={(routingProps) => {
                        return <StockDetails {...routingProps}/>
                    }}/>
                    <Route path="/portfolio" component={auth(Portfolio)}/>
                    <Route path="/faq" component={Faq}/>
                    <Route path="/dashboard" component={auth(Dashboard)}/>
                    <Route path="/stocks" component={BrowseStocks}/>
                    <Route path="/transactions" component={auth(Transactions)}/>
                    <Route exact path="/" component={Home}/>
                    <Route path="/account" component={AccountRoutes}/>
                    <Route component={NotFound}/>
                </Switch>
            </div>
        );
    }
}

export default App;


