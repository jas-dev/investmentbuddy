import React from 'react';
import AddFunds from './add_funds/add_funds'
import Table from "../../table";

export default props =>{
    return (
        <div>
            <h3 className='center green-text text-darken-2'>Portfolio</h3>
            <AddFunds/>
            <Table/>
        </div>
    )
}