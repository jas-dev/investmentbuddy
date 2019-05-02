import React, {Fragment} from 'react';
import './account_info.scss';
import {convertAccountData} from "../../helpers";
import {moneyCommas} from "../../helpers";
import RenderTable from '../../render_table/render_table';



const AccountInfo = props => {
    if (!props) {
        return null;
    }

    const {accountData} = props;

    return(
        <Fragment>
            <i className="material-icons">account_balance</i>
            <table className='responsive-table'>
                <thead>
                <tr>
                    <th>Available Balance</th>
                    <th>Available to Trade</th>
                    <th>Total Assets</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td>{`$${moneyCommas(accountData[0].avail_balance)}`}</td>
                    <td>{`$${moneyCommas(accountData[0].avail_to_trade)}`}</td>
                    <td>{`$${moneyCommas(accountData[0].total_asset)}`}</td>
                </tr>
                </tbody>
            </table>
        </Fragment>
    );
}

export default AccountInfo;

