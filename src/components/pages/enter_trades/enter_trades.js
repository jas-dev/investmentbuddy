import React, {Component} from 'react';
import MakeTradesForm from './enter_trades_form';

import './enter_trades.scss';
import axios from "axios";

class MakeTrades extends Component {
    submit = async inputs => {
        const {symbol, buy_sell, shares, price} = inputs;
        const resp = await axios.get(`/api/addtransaction.php?symbol=${symbol}&buy_sell=${buy_sell}&shares=${shares}&price=${price}`);

        let toastMessage = '';
        const {message, error, success} = resp.data;
        if (message) {
            toastMessage = message;
        } else {
            toastMessage = error ? error : 'Could not connect to database, try again later.';
        }

        M.toast({html: toastMessage});
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