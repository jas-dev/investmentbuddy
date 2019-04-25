import React, {Component} from 'react';
import RenderTable from "../../render_table/render_table";
import axios from "axios";


class AllStocks extends Component{
    constructor(props) {
        super(props);

        this.state = {
            stocks: []
        };
    }
    componentDidMount() {
        this.getStockData()
    }

    getStockData(){
        axios.get('/api/getstocks.php').then(resp=>{

            this.setState({
                stocks: resp.data.stocks
            })
        });

    }

   /* goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`)
    }*/

    render(){

        return(
            <div className='all-stocks container'>
                <h5 className=''>All Stocks</h5>
                <RenderTable history={this.state.stocks}/>
            </div>
        )
    }
}

export default AllStocks;