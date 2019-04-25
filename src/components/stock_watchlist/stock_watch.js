import React, {Component, Fragment} from 'react';
import axios from 'axios';
import RenderTable from '../render_table/render_table'

class Watchlist extends Component{
    constructor(props){
        super(props);

        this.state = {
            stocks: []
        }
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

    render(){
        if(!this.state.stocks.length){
            return null;
        }

        return(
           <div className='container'>
                <h5 className=''>Watchlist</h5>
                <RenderTable stocks={this.state.stocks}/>
           </div>
        )
    }
}

export default Watchlist;