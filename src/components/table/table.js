import React, {Component, Fragment} from 'react';
import axios from 'axios';
import StockListing from '../pages/all_stocks/stock_listing'

class Table extends Component{
    constructor(props) {
        super(props);

        this.state = {
            stocks: []
        }
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
    goToDetails(){
        this.props.history.push(`/stockdetails`)
    }

    render(){
        const stockList = this.state.stocks.map((stock) => {
            return <StockListing key={stock.id} {...stock} goToDetails={this.goToDetails}/>;
        });


        return(
            <Fragment>
                <ul className="collection hoverable">
                    {stockList}
                </ul>
            </Fragment>
        )
    }
}

export default Table;
