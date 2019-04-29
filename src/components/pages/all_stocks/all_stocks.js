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
        console.log('all stocks state:', this.state)
    }
    
    componentDidMount() {
        this.getStockData();

    }

    getStockData(){
        axios.get('/api/getstocks.php').then(response=> {
            console.log('all stocks server response:', response);

            this.setState({
                stocks: response.data.stocks
            });
        });


    }

    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`)
    }

    addToWatchList(symbol){
        axios.get("/api/addwatchlist.php").then(response=>{
            console.log("Add to watch list response: ", response);
        })
    }

    render(){
        console.log("All Stocks Props:", this.props);
        if(!this.state.stocks.length){
            return null;
        }

        return(
            <div className='all-stocks container'>
                <h1 className=''>All Stocks</h1>
                <div className="row">
                    <Search/>
                </div>
                <RenderTable stocks={this.state.stocks} goToDetails={this.goToDetails} addWatch={this.addToWatchList}/>
            </div>
        )
    }
}

export default AllStocks;