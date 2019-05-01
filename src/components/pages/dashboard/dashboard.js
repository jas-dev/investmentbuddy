import React, {Component} from 'react';
import Portfolio from '../portfolio/portfolio';
import Watchlist from "../../stock_watchlist/stock_watch";
import Ticker from '../../ticker';
import Loader from "../../loader";
import axios from "axios";

class Dashboard extends Component {
    constructor(props){
        super(props);
        this.state = {
            ticker: null
        };
    }
    componentDidMount(){
        axios.get("/api/getstocks.php").then(response=>{
            this.setState({
                ticker: response.data.stocks
            });
        });
    }
    render(){
        if (this.state.ticker===null){
            return <Loader/>
        } else {

            return (
                <div className='dashboard-wrapper'>
                    <div className='ticker-container'>
                        <Ticker stocks={this.state.ticker}/>
                    </div>
                    <div className='container'>
                        <h1>Dashboard</h1>
                    </div>
                    <div className='portfolio'>
                        <Portfolio/>
                    </div>
                    <div className='watchlist'>
                        <Watchlist history={this.props.history}/>
                    </div>
                </div>
            )
        }
    }
}

export default Dashboard;
