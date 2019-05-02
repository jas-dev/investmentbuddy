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
            <div className='row'>
                <div className="col s6 "><i className="material-icons">account_balance</i></div>
                <div className="col s5 left offset-s2">
                    <div>Available Balance:</div>
                    <div>Available To Trade:</div>
                    <br/>
                    <div>Total Assets:</div>
                </div>
                <div className="col s3">
                    <div className="">{`$${moneyCommas(accountData[0].avail_balance)}`}</div>
                    <div className="">{`$${moneyCommas(accountData[0].avail_to_trade)}`}</div>
                    <br/>
                    <div className="">{`$${moneyCommas(accountData[0].total_asset)}`}</div>
                </div>
            </div>
        </Fragment>
    );
}

export default AccountInfo;

