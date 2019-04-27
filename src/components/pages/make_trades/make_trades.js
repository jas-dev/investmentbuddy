import React, {Component} from 'react';
import MakeTradesForm from './make_trades_form';

import './make_trades.scss';

class MakeTrades extends Component {
    submit = (values) => {
        console.log(values);
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