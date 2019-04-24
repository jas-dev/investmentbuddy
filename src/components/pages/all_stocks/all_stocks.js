import React, {Component} from 'react';
import Table from "../../table";


class AllStocks extends Component{
    render(){

        return(
            <div className='all-stocks container'>
                <h5 className=''>All Stocks</h5>
                <Table/>
            </div>
        )
    }

}

export default AllStocks;