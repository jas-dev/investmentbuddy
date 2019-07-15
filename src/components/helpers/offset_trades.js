import React, {Component} from 'react';
import {withRouter} from 'react-router';
import RenderTable from '../render_table/render_table';

class WithRouterOffsetTrades extends Component {
    constructor(props){
        super(props);

        this.goToDetails = this.goToDetails.bind(this);
    }
    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`);
    }
    render(){
        return (
            <div className=''>
                <h5>Offset Trades</h5>
                <div className='card'>
                    <RenderTable stocks={this.props.offsetTrades} offsetTrades={true} goToDetails={this.goToDetails}/>
                </div>
            </div>
        )
    }
}

const OffsetTrades = withRouter(WithRouterOffsetTrades);

export default OffsetTrades;