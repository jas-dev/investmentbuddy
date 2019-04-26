import React, {Component} from 'react';
import InfoCard from '../../stock_infocard/stock_infocard';
import Stock_chart from '../../chart/stock_chart';
import axios from 'axios';
import {formatHistory, capitalize} from "../../helpers";
import { format } from 'path';

class StocksDetails extends Component{
    constructor(props) {
        super(props);

        this.state = {
            company: null,
            history: null
        }
    }

    componentDidMount(){
        axios.get('/api/getstockdetails.php').then(resp=>{
            this.setState({
                company: resp.data.company,
                history: formatHistory(resp.data)
            });
        })
    }

    render(){
        if (this.state.history===null || this.state.company===null){
            return null;
        } else {
        return(
            <div className='details-wrapper container'>
                <h5 className=''>Stock Details</h5>
                <div className='row card'>
                    <div className='col s12 center'>
                    <Stock_chart {...this.state.history}/>
                    </div>
                    <div className='col s12 card'>
                        <InfoCard {...this.state.company}/>
                    </div>
                </div>
            </div>
        )
        }
    }
}

export default StocksDetails;


