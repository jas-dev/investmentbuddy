import React, {Fragment} from 'react';
import {formatHeaders} from "../helpers";

export default props =>{
    //if receiving data from get stocks

    const headingKey = props.headings.map( (key, index)=>{
        return(
            <th className='color yellow lighten-4' key={index}>{formatHeaders(key)}</th>
        )
    });
    //if receiving data from get transactions

    //if receiving data from get account data

    return (
       <Fragment>
           {headingKey}
       </Fragment>
    );
}
