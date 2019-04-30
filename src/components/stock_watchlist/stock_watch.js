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
            
            this.setState({
                stocks: resp.data.stocks
            });

        })
    }

    handleAddToWatchlist = inputs => {
        const {symbol} = inputs;
        const account_id = 2;
        let message = '';
        axios.get(`/api/addwatchlist.php?account_id=${account_id}&symbol=${symbol.toUpperCase()}`).then(resp=>{
            
            if (resp.data.message) {
                message = resp.data.message;
                if (resp.data.success) {
                    this.getStockData();
                }
            } else {
                message = 'Could not connect to database, try again later.'
            }
            M.toast({
                html: message
            });
            this.getStockData();
        })
    }

    handleDeleteFromWatchlist = symbol => {
        const account_id = 2;
        let message = '';
        axios.get(`/api/deletewatchlist.php?account_id=${account_id}&symbol=${symbol.toUpperCase()}`).then(resp=>{
            
            if (resp.data.message) {
                message = resp.data.message;
                if (resp.data.success) {
                    this.getStockData();
                }
            } else {
                message = 'Could not connect to database, try again later.'
            }
            M.toast({
                html: message
            });
        })
    }

    goToDetails = symbol =>{
        this.props.history.push(`/stockdetails/${symbol}`)
    }

    render(){
        if(!this.state){
            return null;
        }

        return(

            <div className='container'>
                <h5 className=''>Watchlist</h5>
                {this.state.stocks && this.state.stocks.length && <RenderTable stocks={this.state.stocks} watchlist={true} delete={this.handleDeleteFromWatchlist} goToDetails={this.goToDetails}/>}
                <AddToWatchlistForm handler={this.handleAddToWatchlist}/>
            </div>

        )
    }
}

export default Watchlist;