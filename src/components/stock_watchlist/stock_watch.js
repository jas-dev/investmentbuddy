import React, {Component, Fragment} from 'react';
import axios from 'axios';
import RenderTable from '../render_table/render_table'
import AddToWatchlistForm from './stock_watch_form';
import './stock_watch.scss';

class Watchlist extends Component{
    constructor(props){
        super(props);

        this.state = {
            stocks: []
        };
    }

    componentDidMount() {
        this.getStockData();
    }

    getStockData(){
        axios.get('/api/getwatchliststocks.php').then(resp=>{
            console.log('response from stockwatch:', resp);
            this.setState({
                stocks: resp.data.stocks
            });

        })
    }

    handleAddToWatchlist = inputs => {
        console.log('trying to add to watchlist, need endpoint');
        console.log(inputs);
    }

    handleDeleteFromWatchlist = symbol => {
        console.log('trying to delete ', symbol);
    }

    goToDetails = symbol =>{
        this.props.history.push(`/stockdetails/${symbol}`)
    }

    render(){
        if(!this.state.stocks.length){
            return null;
        }

        return(
           <div className='container'>
                <h5 className=''>Watchlist</h5>
                <RenderTable stocks={this.state.stocks} watchlist={true} delete={this.handleDeleteFromWatchlist} goToDetails={this.goToDetails}/>
                <AddToWatchlistForm handler={this.handleAddToWatchlist}/>
           </div>
        )
    }
}

export default Watchlist;