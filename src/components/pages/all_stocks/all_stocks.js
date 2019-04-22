import React, {Component} from 'react';
import Table from "../../table";


class AllStocks extends Component{
    render(){

        return(
            <div className='all-stocks card'>
                <h5 className='green-text text-darken-3'>All Stocks</h5>
                <Table/>
            </div>
        )
    }

}

export default AllStocks;