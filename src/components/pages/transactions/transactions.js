import React, {Component} from 'react';
import axios from 'axios';
import RenderTable from '../../render_table/render_table'

class Transactions extends Component{
    constructor(props){
        super(props);

        this.state = {
            stocks: []
        }
        this.goToDetails= this.goToDetails.bind(this)
    }

    componentDidMount() {
        this.getStockData()
    }

    getStockData(){
        axios.get('/api/gettransactions.php').then(resp=>{

            this.setState({
                stocks: resp.data.transactions
            })
        });
    }

    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`);
    }

    render(){
        if(!this.state.stocks.length){
            return null;
        }

        return (
            <div className='container'>
                <h5>Transaction History</h5>
                <RenderTable stocks={this.state.stocks} goToDetails={this.goToDetails}/>
            </div>
        )

    }

}

export default Transactions;