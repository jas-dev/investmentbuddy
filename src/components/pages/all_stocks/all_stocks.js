import React, {Component} from 'react';
import RenderTable from "../../render_table/render_table";
import axios from "axios";


class AllStocks extends Component{
    constructor(props) {
        super(props);

        this.state = {
            stocks: []
        };

        console.log('all stocks state:', this.state)
    }
    
    componentDidMount() {
        this.getStockData();

    }

    getStockData(){
        axios.get('/api/getstocks.php').then(response=> {
            console.log('response:', response);

            this.setState({
                stocks: response.data.stocks
            });
        });


    }

   /* goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`)
    }*/

    render(){
        if(!this.state.stocks.length){
            return null;
        }

        return(
            <div className='all-stocks container'>
                <h5 className=''>All Stocks</h5>
                <RenderTable stocks= {this.state.stocks} />
            </div>
        )
    }
}

export default AllStocks;