import React from 'react';
import RenderTh from './render_th';
import RenderTr from './render_tr';


export default props =>{

    if(!props.stocks){
        return null;
    }

    console.log('render table props:',props);

    const columnNames = Object.keys(props.stocks[0]);
    if (props.watchlist) {
        columnNames.push('');
    }
    if (props.addWatch) {
        columnNames.push('');
    }

    // render the table headers

    const tableHeading = (<RenderTh headings={columnNames}/>);


    // render the data

    const tableRow = props.stocks.map((stock, index) => {
        return (
            <RenderTr delete={props.delete} watchlist={props.watchlist} key={index } values={columnNames.map(key => stock[key])} details={props.goToDetails} addWatch={props.addWatch}/>
        )
    });

    return (
        <div className='card card-padout'>
            <table className='responsive-table striped'>
                <thead>
                    <tr>
                        {tableHeading}
                    </tr>
                </thead>
                    <tbody>
                        {tableRow}
                    </tbody>
            </table>
        </div>
    )
}


