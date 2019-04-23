import React, {Component} from 'react';
import stockchart from '../../assets/images/stockchart.jpg';
import './chart.scss';

class Chart extends Component{
    render(){
        return(
            <div className='center'>
               <img className='stockchart' src={stockchart}/>
            </div>
        )
    }
}

export default Chart;