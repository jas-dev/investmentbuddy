import React, {Component} from 'react';
import axios from 'axios';


class Card extends Component{

    render(){
        console.log('props:',this.props);

        return (
            <div className=''>
                <table className='responsive-table striped'>
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>GICS</th>
                            <th>Category</th>
                            <th>Headquarters</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>{this.props.name}</td>
                            <td>{this.props.GICS}</td>
                            <td>{this.props.category}</td>
                            <td>{this.props.headquarters}</td>
                        </tr>

                    </tbody>
                </table>
                <h6>Stock Data</h6>
            </div>
        )
    }
}

export default Card;
