import React, {Fragment} from 'react';

export default props =>{

    const rowData = props.values.map((row, index)=>{
       return(
            <td key={index}>{row}</td>

       )
    });

    return (
        <tr onClick={() => props.details(props.values[0])}>{rowData}</tr>
    )
}


