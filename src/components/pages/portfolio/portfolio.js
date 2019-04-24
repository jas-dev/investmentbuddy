import React from 'react';
import AddFunds from './add_funds/add_funds'
import Table from "../../table";
import Chart from '../../chart/chart'

export default props =>{
    return (
        <div className='portfolio-wrapper'>
            <h5 className=''>Manage your portfolio</h5>

            <div className='porfolio-summary row card'>
                <div className='container col s6'>

                        <div className='col s6'>Account ID:</div>
                        <div className='col s6'>[ID]</div>

                        <div className='col s6'>Total Assets:</div>
                        <div className='col s6'>[assets]</div>

                        <div className='col s6'>Available to trade:</div>
                        <div className='col s6'>[funds]</div>

                        <div className='col s6'>Avail to withdraw:</div>
                        <div className='col s6'>[funds]</div>
                        <div className='col s6'>
                            <AddFunds/>
                        </div>
                </div>

                <div className='container card col s6'>
                    Performance
                    <Chart/>

                </div>
            </div>


            <div className=''>
                <Table/>
            </div>

        </div>
    )
}