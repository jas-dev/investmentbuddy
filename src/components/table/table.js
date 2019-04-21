import React, {Component, Fragment} from 'react';

class Table extends Component{
    render(){
        return(
            <Fragment>
                <table className='striped responsive-table'>
                    <thead>
                    <tr>
                        <th>Date</th>
                        <th>Name</th>
                        <th>Symbol</th>
                        <th>Buy/Sell</th>
                        <th>Qty</th>
                        <th>Current Price</th>
                        <th>Closing Price</th>
                        <th>Volume</th>
                        <th> + / - </th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>2019-04-17</td>
                        <td>Apple</td>
                        <td>AAPL</td>
                        <td>Buy</td>
                        <td>100</td>
                        <td>$121.85</td>
                        <td>$122.85</td>
                        <td>19010372</td>
                        <td>$1.00</td>
                    </tr>
                    <tr>
                        <td>2019-04-17</td>
                        <td>Abbot Laboratories</td>
                        <td>ABT</td>
                        <td>Buy</td>
                        <td>100</td>
                        <td>$121.85</td>
                        <td>$122.85</td>
                        <td>19010372</td>
                        <td>$1.00</td>
                    </tr>
                    <tr>
                        <td>2019-04-17</td>
                        <td>Akamai Technologies</td>
                        <td>AKAM</td>
                        <td>Buy</td>
                        <td>100</td>
                        <td>$121.85</td>
                        <td>$122.85</td>
                        <td>19010372</td>
                        <td>$1.00</td>
                    </tr>
                    </tbody>
                </table>
            </Fragment>
        )
    }
}

export default Table;
