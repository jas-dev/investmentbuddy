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
                availBalance: resp.avail_balance,
                availToTrade: resp.avail_to_trade,
                totalAsset: resp.total_asset
            })
        });
    }

    render(){
       /* if(!this.state.length){
            return console.log('async problem')
        }
*/
        return(
            <div className="card">
                hi
                <RenderTable stocks={convertAccountData(this.state)}/>
            </div>
        );
    }
}

export default AccountInfo;