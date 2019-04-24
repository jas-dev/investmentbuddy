import React, {Component} from 'react';
import AddFunds from './add_funds/add_funds'
import RenderTable from "../../render_table/render_table";
import Chart from '../../chart/chart'
import AccountInfo from '../../account/info'

class Portfolio extends Component{
    constructor(props){
        super(props)
    }
    render(){
        return (
            <div className='portfolio-wrapper container'>
                <h5 className=''>Manage your portfolio</h5>

                <div className='porfolio-summary row card'>

                    <div className='col s6'>
                        <Chart/>
                    </div>
                    <div className=''>
                        <AccountInfo/>
                    </div>
                    <div className="col s6 container">
                        <AddFunds/>
                    </div>
                    <div className="col s12">
                        <RenderTable/>
                    </div>

                </div>
            </div>
        )
    }
}

export default Portfolio;
