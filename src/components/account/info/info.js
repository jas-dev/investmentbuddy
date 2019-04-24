import React from 'react';
import './info.scss'

export default props=>{
    return(
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
            </div>
        </div>
    )
}