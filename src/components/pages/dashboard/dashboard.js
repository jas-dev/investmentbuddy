import React, {Component} from 'react';
import Portfolio from '../portfolio/portfolio';
import Watchlist from "../../stock_watchlist/stock_watch";
import Ticker from '../../ticker';
import Loader from "../../loader";
import axios from "axios";
import MarketIndexDetails from '../stock_details/market_index_details';
import PortfolioDash from "../portfolio/portfolioDash";

class Dashboard extends Component {
    constructor(props){
        super(props);
        this.state = {
            ticker: null
        };
        this.tickerDetails = this.tickerDetails.bind(this);
    }
    componentDidMount(){
        axios.get("/api/getstocks.php").then(response=>{
            this.setState({
                ticker: response.data.stocks
            });
        });



    }

    tickerDetails(event){
        const clickedText = event.currentTarget.textContent;
        let symbol="";

        for (let index=0; index<clickedText.length; index++){
            if (clickedText[index]!==" "){
                symbol+=clickedText[index];
            } else {
                break;
            }
        }

        this.props.history.push(`/stockdetails/${symbol}`);
    }

    render(){

        if (this.state.ticker===null){
            return <Loader/>

        } else {

            return (
                <div className='dashboard-wrapper'>
                    <div className='ticker-container'>
                        <Ticker stocks={this.state.ticker} details={this.tickerDetails}/>
                    </div>

                    <div className='dashboard-market-index container'>
                        <h5>Dashboard</h5>
                        <div className='card'>
                            <MarketIndexDetails/>
                        </div>
                    </div>

                    <div className='portfolio'>
                        <PortfolioDash/>
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

