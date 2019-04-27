import React, {Component} from 'react';
import axios from 'axios';
import './info.scss';
import {convertAccountData} from "../../helpers";
import RenderTable from '../../render_table/render_table';


class AccountInfo extends Component{

    constructor(props){
        super(props);

        this.state = {
            accountData: []
        }
    }

    componentDidMount() {
        console.log('info mounted');
        this.getAccountData();

    }

    getAccountData(){
        console.log('we getting here?')
        axios.get('/api/getaccountbalance.php').then(resp=>{

            console.log('account info resp:', resp);
            this.setState({
                accountData: resp.data
            })
        });
    }

    render(){
       if(!this.state){
           return;
       }

        /* if(!Array.isArray(this.state.totalAsset)){
            console.log('AccountInfo state:',this.state);
            return <div>not ready</div>
        }*/


        console.log('account info state from render:',this.state);

        return(
            <div>
                <div className="col s3">
                    <div>Available Balance:</div>
                    <div>Available to Trade:</div>
                    <div>Total Assets:</div>
                </div>

                <div className="">{this.state.accountData.avail_balance}</div>
                <div className="">{this.state.accountData.avail_to_trade}</div>
                <div className="">{this.state.accountData.total_asset}</div>

            </div>

        );
    }
}

export default AccountInfo;