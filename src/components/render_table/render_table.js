import React from 'react';
import RenderTh from './render_th';
import RenderTr from './render_tr';


export default props =>{

    const columnNames = Object.keys(props.stocks[0]);

    // render the table headers

    const tableHeading = (<RenderTh headings={columnNames}/>);


    // render the data

    const tableRow = props.stocks.map((stock, index) => {
        return (
            <RenderTr key={index } values={columnNames.map(key => stock[key])} details={props.goToDetails}/>
        )
    });

    return (
        <div className='card'>
            <table className='responsive-table highlight'>
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


