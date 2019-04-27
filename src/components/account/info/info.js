import React, {Component} from 'react';
import axios from 'axios';
import './info.scss';
import {convertAccountData} from "../../helpers";
import RenderTable from '../../render_table/render_table';


class AccountInfo extends Component{

    constructor(props){
        super(props);

        this.state = {
            totalAsset: [],
            availBalance: [],
            availToTrade:[]
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
                availBalance: resp.data.avail_balance,
                availToTrade: resp.data.avail_to_trade,
                totalAsset: resp.data.total_asset
            })
        });
    }

    render(){
        if(!Array.isArray(this.state.totalAsset)){
            return <div>not ready</div>
        }
       /* if(!this.state.length){
            return console.log('async problem')
        }
*/
        console.log('satate:',this.state);
        return(
            <div className="card">
                <RenderTable stocks={this.state.availBalance}/>
                <RenderTable stocks={this.state.availToTrade}/>
            </div>
        );
    }
}

export default AccountInfo;