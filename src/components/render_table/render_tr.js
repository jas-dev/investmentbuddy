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
        <tr onClick={props.history.push}>{rowData}</tr>
    )

}