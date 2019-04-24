import React, {Component, Fragment} from 'react';
import axios from 'axios';
import StockListing from '../pages/all_stocks/stock_listing';

class RenderTable extends Component{
    constructor(props) {
        super(props);

        this.state = {
            stocks: []
        };

        console.log('state:', this.state);
        this.goToDetails = this.goToDetails.bind(this)
    }
    componentDidMount() {
        this.getStockData();
    }

    getStockData(){
        axios.get('/api/getstocks.php').then(resp=>{
            console.log('stock data:', resp);

            this.setState({
                stocks: resp.data.stocks
            })
        });

    }
    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`)
    }

    render(){
        const stockList = this.state.stocks.map(stocks => {
            return(
                <StockListing key={stocks.symbol} {...stocks} goToDetails={this.goToDetails}/>
            )
        });


        return(
            <Fragment>
                <ul className="collection card">
                    {stockList}
                </ul>
            </Fragment>
        )
    }
}

export default RenderTable;
