import React, {Fragment} from 'react';

export default props =>{

    const rowData = props.values.map((row, index)=>{
       return(
            <td key={index}>{row}</td>

       )
    });
console.log("Tr props: ", props);
    if (props.watchlist) {
        rowData[props.values.length - 1] = <td key={props.values.length}>
            <button onClick={(event) => {
                props.delete(props.values[0]);
                event.stopPropagation();
            }} className="btn waves-effect waves-light green darken-2">Remove</button>
        </td>
    }
    if (props.addWatch){
        rowData[props.values.length - 1] = <td key={props.values.length}>
            <button onClick={()=>{props.addWatch(props.values[0]);}} className="btn green darken-2">Add To Watchlist</button>
            </td>
    }

    return (
        <tr onClick={() => props.details(props.values[0])}>{rowData}</tr>
    )
}


