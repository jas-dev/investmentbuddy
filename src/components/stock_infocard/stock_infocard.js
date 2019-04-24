import React, {Component} from 'react';
import axios from 'axios';


class Card extends Component{
    componentDidMount() {
        this.getStockDetails();
    }

    async getStockDetails(){
        axios.get('/api/getstockdetails.php').then(resp=>{
            console.log('stock details:', resp)
        })
    }

    render(){
        return (
            <div className=''>
                <table className='responsive-table striped'>
                    <tr>
                        <th>Symbol</th>
                        <th>Company Name</th>
                        <th>GICS</th>
                        <th>Category</th>
                        <th>Headquarters</th>
                        <th>Founded</th>
                    </tr>
                    <tr>
                        <td>symbol</td>
                        <td>company</td>
                        <td>gics</td>
                        <td>category</td>
                        <td>hq</td>
                        <td>founded</td>
                    </tr>
                </table>
                <h6>Stock Data</h6>
            </div>
        )
    }
}

export default Card;
