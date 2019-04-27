import React, {Component} from 'react';
import axios from 'axios';
import RenderTable from '../render_table/render_table'


class Card extends Component{

    render(){
        console.log('props from stock infocard:',this.props.stocks);

        const {
            changeAmount,
            changePercent,
            high,
            latestTradingDay,
            low,
            open,
            previousClose,
            price,
            volume
        } = this.props.stocks;

        return (

            <div className=''>
                <table className='responsive-table striped card'>
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>GICS</th>
                            <th>Category</th>
                            <th>Headquarters</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{this.props.name}</td>
                            <td>{this.props.GICS}</td>
                            <td>{this.props.category}</td>
                            <td>{this.props.headquarters}</td>
                        </tr>
                    </tbody>
                </table>

                <table className='responsive-table striped card'>
                    <thead>
                        <tr>
                            <th>Price</th>
                            <th>Open</th>
                            <th>High</th>
                            <th>Low</th>
                            <th>Change Amt.</th>
                            <th>Change %</th>
                            <th>Prev. Close</th>
                            <th>Last Trading Day</th>
                            <th>Volume</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{price}</td>
                            <td>{open}</td>
                            <td>{high}</td>
                            <td>{low}</td>
                            <td>{changeAmount}</td>
                            <td>{changePercent}</td>
                            <td>{previousClose}</td>
                            <td>{latestTradingDay}</td>
                            <td>{volume}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        )
    }
}

export default Card;
