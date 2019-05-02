import React, {Component} from 'react';
import InfoCard from '../../stock_infocard/stock_infocard';
import Multi_Stock_chart from '../../chart/multi_stock_chart';
import axios from 'axios';
import {formatMarketIndex, capitalize} from "../../helpers";
import { format } from 'path';
import Loader from "../../loader";

class MarketIndexDetails extends Component{
    constructor(props) {
        super(props);

        this.state = {
            symbols: null,
            prices: null,
        }
    }

    componentDidMount(){
        this.getMarketIndexData()

    }

    getMarketIndexData(){

        axios.get(`/api/getmarketindex.php`).then(resp=>{
            console.log(resp);
            this.setState({
                symbols: resp.data.symbols,
                prices: formatMarketIndex(resp.data, "prices"),
            });
        })
    }

    render(){

        if (this.state.prices===null || this.state.symbols===null){
            return <Loader/>;
        } else {
            return(
                <div className='details-wrapper container center'>
                    <h5 className=''>Market Index Details</h5>
                    <div className='row'>
                        <div className='col s12'>
                            <Multi_Stock_chart symbolList={this.state.symbols} symbolDataList={this.state.prices}/>
                        </div>
                    </div>
                </div>
            )
        }
    }
}

export default MarketIndexDetails;


