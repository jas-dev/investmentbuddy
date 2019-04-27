import React, {Component} from 'react';
import {reduxForm} from "redux-form";
import MakeTradesForm from './make_trades_form';

import './make_trades.scss';

class MakeTrades extends Component {
    handleSubmit(inputs) {
        console.log(inputs);
    }

    render() {
        return (
            <div className='trade-form container'>
                <h5>Make Trades</h5>
                <div className='divider'/>
                <MakeTradesForm onSubmit={this.handleSubmit}/>
            </div>
        )
    }
}

export default reduxForm({
    form: 'make-trades-form'
})(MakeTrades);