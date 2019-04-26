import React, {Component} from 'react';
import axios from 'axios';
import RenderTable from '../../render_table/render_table'

class Transactions extends Component{
    constructor(props){
        super(props);

        this.state = {
            stocks: []
        }

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

    render(){
        if(!this.state.stocks.length){
            return null;
        }

        return (
            <div className='container'>
                <h5>Transactions</h5>
                <RenderTable stocks={this.state.stocks}/>
            </div>
        )

    }

}

export default Transactions;