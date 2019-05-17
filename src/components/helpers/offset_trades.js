import React from 'react';
import RenderTable from '../render_table/render_table';

export default props =>{

    return (
        <div className=''>
            <h5 className=''>Offset Trades</h5>
            <div className='card'>
                <RenderTable stocks={props.offsetTrades} offsetTrades={true}/>
            </div>
        </div>
    )
}