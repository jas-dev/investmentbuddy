import React, {Component} from 'react';
import MakeTradesForm from './make_trades_form';

import './make_trades.scss';
import axios from "axios";

class MakeTrades extends Component {
    submit = async inputs => {
        const {symbol, buy_sell, shares, price} = inputs;
        console.log(inputs);

        const response = await axios.get(`/api/addtransaction.php?symbol=${symbol}&buy_sell=${buy_sell}&shares=${shares}&price=${price}`);

        console.log(response);
    };

    render() {
        return (
            <div className='trade-page container'>
                <h5>Make Trades</h5>
                <div className='divider'/>
                <MakeTradesForm handler={this.submit}/>
            </div>
        )
    }
}

export default MakeTrades;