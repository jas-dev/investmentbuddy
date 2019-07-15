import React, {Component} from 'react';
import InfoCard from '../../stock_infocard/stock_infocard';
import Stock_chart from '../../chart/stock_chart';
import axios from 'axios';
import {formatHistory, capitalize} from "../../helpers";
import { format } from 'path';
import Loader from "../../loader";
import rotate from "../../../assets/images/rotate.gif"

class StocksDetails extends Component{
    constructor(props) {
        super(props);

        this.state = {
            company: null,
            priceHistory: null,
            percentHistory: null,
            stock: null
        }
    }

    componentDidMount(){
        this.getStockData()

    }

    getStockData(){

        axios.get(`/api/getstockdetails.php?stock_symbol=${this.props.match.params.symbol}`).then(resp=>{

            this.setState({
                company: resp.data.company,
                priceHistory: formatHistory(resp.data, "price"),
                percentHistory: formatHistory(resp.data, "percent"),
                stock: resp.data.stock
            });
        })
    }

    render(){

        if (this.state.priceHistory===null || this.state.percentHistory===null || this.state.company===null){
            return <Loader/>;
        } else {
            return(
                <div className='details-wrapper container'>
                    <h5 className='left'>Stock Details</h5>
                    <div className='row'>
                        <div className='col s12 card hide-on-small-and-down'>
                            <Stock_chart {...this.state.priceHistory} price={true}/>
                        </div>
                        <div className="col s12 card hide-on-small-and-down">
                            <Stock_chart {...this.state.percentHistory} percent={true}/>
                        </div>
                        <div className="col s12 card card-padout hide-on-med-and-up">
                            <img src={rotate} alt="" className="rotateImg"/>
                            <div className="center">
                                <span>Rotate for Stock Price Charts</span>
                            </div>
                        </div>
                        <div className='col s12'>
                            <InfoCard {...this.state.company} stocks={this.state.stock}/>
                        </div>
                    </div>
                </div>
            )
        }
    }
}

export default StocksDetails;


