import React, {Component} from 'react';
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

    componentDidMount(){
        this.getStockData();
    }

    getStockData(){
        axios.get(`/api/getwatchliststocks.php`).then(resp => {
            this.setState({
                stocks: resp.data.stocks
            });
        });
    }

    handleAddToWatchlist = inputs => {
        const {symbol} = inputs;
        axios.get(`/api/addwatchlist.php?symbol=${symbol.toUpperCase()}`).then(resp => {

            let toastMessage = '';
            const {message, success, error} = resp.data;
            if (message) {
                toastMessage = message;
                if (success) {
                    this.getStockData();
                }
            } else {
                toastMessage = error ? error : 'Could not connect to database, try again later.'
            }

            M.toast({html: toastMessage});
        });
    }

    handleDeleteFromWatchlist = symbol => {
        axios.get(`/api/deletewatchlist.php?symbol=${symbol.toUpperCase()}`).then(resp=>{

            let toastMessage = '';
            const {message, success, error} = resp.data;
            if (message) {
                toastMessage = message;
                if (success) {
                    this.getStockData();
                }
            } else {
                toastMessage = error ? error : 'Could not connect to database, try again later.'
            }
            M.toast({
                html: toastMessage
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
                <h6 className=''>Watchlist</h6>
                {this.state.stocks && this.state.stocks.length && <RenderTable stocks={this.state.stocks} watchlist={true} delete={this.handleDeleteFromWatchlist} goToDetails={this.goToDetails}/>}
                <AddToWatchlistForm handler={this.handleAddToWatchlist}/>
            </div>

        )
    }
}

export default Watchlist;