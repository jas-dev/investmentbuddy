import React, {Component} from 'react';
import InfoCard from '../../stock_infocard/stock_infocard'
import Chart from '../../chart/chart'

class StocksDetails extends Component{
    render(){
        return(
            <div className='details-wrapper container'>
                <h5 className=''>Stock Details</h5>
                <div className='row card'>
                    <div className='col s12 '>
                        <Chart/>
                    </div>
                    <div className='col s12'>
                        <div className="col s12 card">
                            <InfoCard/>
                        </div>
                    </div>
                </div>

            </div>
        )
    }
}

export default StocksDetails;