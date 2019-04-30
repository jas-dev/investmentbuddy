import React, {Component} from 'react';
import RenderTable from "../../render_table/render_table";
import axios from "axios";
import Search from '../../search';


class AllStocks extends Component{
    constructor(props) {
        super(props);

        this.state = {
            stocks: []
        };
        this.goToDetails = this.goToDetails.bind(this);
       
    }
    
    componentDidMount() {
        this.getStockData();

    }

    getStockData(){
        axios.get('/api/getstocks.php').then(response=> {

            this.setState({
                stocks: response.data.stocks
            });
        });


    }

    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`)
    }

    addToWatchList(symbol){
        axios.get(`/api/addwatchlist.php?account_id=2&symbol=${symbol}`);
    }

    render(){
    
        if(!this.state.stocks.length){
            return null;
        }

        return(
            <div className='all-stocks container'>
                <h1 className=''>All Stocks</h1>
                <div className="row">
                    <Search/>
                </div>
                <RenderTable stocks={this.state.stocks} goToDetails={this.goToDetails} 
                    addWatch={this.addToWatchList} allStocks={true}/>
            </div>
        )
    }
}

export default AllStocks;