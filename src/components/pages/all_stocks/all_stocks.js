import React, {Component} from 'react';
import Table from "../../table";


class AllStocks extends Component{
    render(){

        return(
            <div className='all-stocks'>
                <h3 className='center'>All Stocks</h3>
                <Table/>
            </div>
        )
    }

}

export default AllStocks;