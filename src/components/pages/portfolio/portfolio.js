import React from 'react';
import AddFunds from './add_funds/add_funds'
import Table from "../../table";
import Chart from '../../chart/chart'

export default props =>{
    return (
        <div className='portfolio-wrapper card'>
            <h5 className='green-text text-darken-3'>Manage your portfolio</h5>

            <div className='porfolio-summary row'>
                <div className='container col s6'>

                        <div className='col s3'>Account ID:</div>
                        <div className='col s3'>[ID]</div>

                        <div className='col s3'>Total Assets:</div>
                        <div className='col s3'>[assets]</div>

                        <div className='col s3'>Avail.- trade:</div>
                        <div className='col s3'>[funds]</div>

                        <div className='col s3'>Avail.- withdraw:</div>
                        <div className='col s3'>[funds]</div>

                </div>
                <div className='container card col s6'>
                    Performance
                    <Chart/>

                </div>
            </div>

            <AddFunds/>
            <div className=''>
                <Table/>
            </div>

        </div>
    )
}