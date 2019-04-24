import React, {Component} from 'react';
import InfoCard from '../../stock_infocard/stock_infocard';
import Stock_chart from '../../chart/stock_chart';
import axios from 'axios';

class StocksDetails extends Component{
    constructor(props) {
        super(props);

        this.state = {
            company: null
        }


    }

    componentDidMount(){
        axios.get('/api/getstockdetails.php').then(resp=>{
            console.log('stock details resp:', resp);

            this.setState({
                company: resp.data.company
            });
        })
    }

    render(){
        return(
            <div className='details-wrapper container'>
                <h5 className=''>Stock Details</h5>
                <div className='row card'>
                    <div className='col s12 center'>
                        <Stock_chart/>
                    </div>
                    <div className='col s12 card'>
                        <InfoCard {...this.state.company}/>
                    </div>
                </div>
            </div>
        )
    }
}

export default StocksDetails;