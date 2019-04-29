import React, {Component} from 'react';
import MakeTradesForm from './enter_trades_form';

import './enter_trades.scss';
import axios from "axios";

class MakeTrades extends Component {
    submit = async inputs => {
        const {symbol, buy_sell, shares, price} = inputs;
        const resp = await axios.get(`/api/addtransaction.php?account_id=2&symbol=${symbol}&buy_sell=${buy_sell}&shares=${shares}&price=${price}`);

        let message = '';
        if (resp.data.message) {
            message = resp.data.message;
        } else {
            message = 'Could not connect to database, try again later.'
        }

        M.toast({html: message});
    };

    render() {
        return (
            <div className='trade-page container'>
                <h5>Enter Trades</h5>
                <MakeTradesForm handler={this.submit}/>
            </div>
        )
    }
}

export default MakeTrades;