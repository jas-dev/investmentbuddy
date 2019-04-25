import React, {Fragment} from 'react';

export default props =>{
    //if receiving data from get stocks

    const headingKey = props.headings.map( key=>{
        return(
            <th>{key}</th>
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
