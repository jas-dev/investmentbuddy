import React, {Component} from 'react';
import axios from 'axios';

import './info.scss';


class AccountInfo extends Component{

    constructor(props){
        super(props);

        this.state = {
            totalAsset: [],
            availBal: [],
            availToTrade:[]
        }
    }

    componentDidMount() {
        this.getAccountData()
    }

    getAccountData(){
        axios.get('/api/getaccountbalance.php').then(resp=>{
            
            this.setState({
                availBalance: resp.data.avail_balance,
                availToTrade: resp.data.avail_to_balance,
                totalAsset: resp.data.total_asset
            })
        });
    }

    render(){
        return null;
    }

}

export default AccountInfo;