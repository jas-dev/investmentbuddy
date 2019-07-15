import React, {Component} from 'react';
import axios from 'axios';
import RenderTable from '../render_table/render_table';
import {formatNegativeMoney, moneyCommas, formatDateTime} from "../helpers";

class Card extends Component{

    render(){
        

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
                <table className='responsive-table striped card card-padout'>
                    <thead>
                        <tr className='yellow lighten-4'>
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

                <table className='responsive-table striped card card-padout'>
                    <thead>
                        <tr className='yellow lighten-4'>
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
                            <td>{`$${moneyCommas(price)}`}</td>
                            <td>{`$${moneyCommas(open)}`}</td>
                            <td>{`$${moneyCommas(high)}`}</td>
                            <td>{`$${moneyCommas(low)}`}</td>
                            <td>{`${formatNegativeMoney(moneyCommas(changeAmount))}`}</td>
                            <td>{`${changePercent}%`}</td>
                            <td>{`$${moneyCommas(previousClose)}`}</td>
                            <td>{formatDateTime(latestTradingDay)}</td>
                            <td>{`${moneyCommas(volume)}`}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        )
    }
}

export default Card;
