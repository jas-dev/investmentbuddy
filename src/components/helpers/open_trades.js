import React, {Component} from 'react';
import {withRouter} from 'react-router';
import RenderTable from '../render_table/render_table';

class WithRouterOpenTrades extends Component {
    constructor(props){
        super(props);

        this.goToDetails = this.goToDetails.bind(this);
    }
    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`);
    }
    render() {
        return (
            <div className=''>
                <h5>Open Trades</h5>
                <div className='card'>
                    <RenderTable stocks={this.props.openTrades} openTrades={true} goToDetails={this.goToDetails}/>
                </div>
            </div>
        )
    }
}

const OpenTrades = withRouter(WithRouterOpenTrades);

export default OpenTrades;