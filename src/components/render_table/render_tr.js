import React, {Fragment} from 'react';

export default props =>{

    const rowData = props.values.map(row=>{
       return(
           <Fragment>
               <td>{row}</td>
           </Fragment>
       )
    });

    return (
        <tr>{rowData}</tr>
    )

}