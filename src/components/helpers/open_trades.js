import React from 'react';
import RenderTable from '../render_table/render_table';

export default props =>{
   
    return (
        <div className="card">
            <h5 className='center'>Open Trades</h5>
            <RenderTable stocks={props.openTrades}/>
        </div>
    )
}