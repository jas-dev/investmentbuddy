import React, {Fragment} from 'react';
import './account_info.scss';
import {convertAccountData} from "../../helpers";
import RenderTable from '../../render_table/render_table';



const AccountInfo = props => {
    if (!props) {
        return null;
    }

    const {accountData} = props;

    return(
        <Fragment>
            <div className='row'>
                <div className="col s6 "><i className="material-icons">account_balance</i><b>Available</b></div>
                <div className="col s5 left offset-s2">
                    <div>Balance:</div>
                    <div>To Trade:</div>
                    <b>Total</b>
                    <div>Assets:</div>
                </div>
                <div className="col s3">
                    <div className="">{accountData.avail_balance}</div>
                    <div className="">{accountData.avail_to_trade}</div>
                    <br/>
                    <div className="">{accountData.total_asset}</div>
                </div>
            </div>
        </Fragment>
    );
}

export default AccountInfo;