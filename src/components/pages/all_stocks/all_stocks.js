import React, {Component} from 'react';
import RenderTable from "../../render_table/render_table";


class AllStocks extends Component{
    render(){

        return(
            <div className='all-stocks container'>
                <h5 className=''>All Stocks</h5>
                <RenderTable history={this.props.history}/>
            </div>
        )
    }
}

export default AllStocks;