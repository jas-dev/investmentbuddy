import React, {Component} from 'react';
import axios from 'axios';
import AddFunds from './add_funds/add_funds';
import RenderTable from "../../render_table/render_table";
import Stock_chart from '../../chart/stock_chart';
import AccountInfo from '../../account/info';
import OpenTrades from '../../helpers/open_trades';
import OffsetTrades from '../../helpers/offset_trades';

class Portfolio extends Component{
    constructor(props){
        super(props);

        this.state = {
            offsetTrades: [],
            openTrades: []
        };
    }

    componentDidMount() {
        this.getStockData()
    }

    getStockData(){
        axios.get('/api/getportfoliodata.php').then(resp=>{
            console.log('response from portfolio call:', resp);
            this.setState({
                offsetTrades: resp.data.offsetTrades,
                openTrades: resp.data.openTrades
            })
        })
    }

    render(){

        if(!this.state.offsetTrades.length || !this.state.openTrades){
            return null;
        }

        console.log('portfolio state:', this.state);

        return (
            <div className='portfolio-wrapper container'>
                <h5 className=''>Manage your portfolio</h5>

                <div className='portfolio-summary row card'>
                    <div className='col s6'>
                        <Stock_chart/>
                    </div>
                    <div className=''>
                        <AccountInfo/>
                    </div>
                    <div className="col s6 container">
                        <AddFunds/>
                    </div>
                    <div className="col s12">
                        <OpenTrades openTrades={this.state.openTrades}/>
                        <OffsetTrades offsetTrades={this.state.offsetTrades}/>
                    </div>
                </div>



            </div>
        )
    }
}

export default Portfolio;
