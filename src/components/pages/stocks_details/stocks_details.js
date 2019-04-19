import React, {Component} from 'react';
import Card from '../../stocks_details_card/detailscard'

class StocksDetails extends Component{
    render(){
        return(
            <div className='stocks-details'>
                <h1 className='center green-text text-darken-2'>Stocks Details</h1>
                <Card/>
                <Card/>
                <Card/>
            </div>

        )
    }
}

export default StocksDetails;