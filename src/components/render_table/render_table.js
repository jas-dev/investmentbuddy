import React from 'react';
import RenderTh from './render_th';
import RenderTr from './render_tr';


export default props =>{

    console.log('props from rendertable:', props);

    if (props.hasOwnProperty('stocks')) {

        const columnNames = Object.keys(props.stocks[0]);

        // render the table headers

        const tableHeading = (<RenderTh headings={columnNames}/>);


        // render the data

        const tableRow = props.stocks.map(stock => {
            return (
                <RenderTr key={stock[columnNames[0]]} values={columnNames.map(key => stock[key])}/>
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
    } else if (props.hasOwnProperty('openTrades') && props.hasOwnProperty('offsetTrades')) {
        
        return (
            <div>
                Hi
            </div>
        )

    } else {
        return;
    }

}


