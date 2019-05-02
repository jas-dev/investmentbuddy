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
                    <div className='container dashboard-header'>
                        <h4>Dashboard</h4>
                    </div>
                    <div className='watchlist'>
                        <Watchlist history={this.props.history}/>
                    </div>
                    <div className='portfolio'>
                        <Portfolio/>
                    </div>

                </div>
            )
        }
    }
}

export default Dashboard;

