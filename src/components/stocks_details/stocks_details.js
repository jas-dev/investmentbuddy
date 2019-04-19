import React, {Component} from 'react';
import Chart from '../chart/chart';

class StocksDetails extends Component{
    render(){
        return(
            <div className='stocks-details'>
                <h1 className='center green-text text-darken-2'>Stocks Details</h1>
                <Chart/>
            </div>

        )
    }
}

export default StocksDetails;