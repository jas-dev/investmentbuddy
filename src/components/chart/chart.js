import React, {Component} from 'react';
//import stockchart from '../../assets/images/stockchart.jpg';
import './chart.scss';
import ChartJS from 'chart.js';

// global options
//Chart.defaults.global.elements.line.borderWidth = 3;
//Chart.defaults.global.animation.duration = 1000;
//Chart.defaults.global.animation.easing = 'easeInBounce';

var lineChartData = {
    labels: ["4/1/2019", "4/2/2019", "4/3/2019", "4/4/2019", "4/5/2019", "4/8/2019", "4/9/2019", "4/10/2019",
        "4/11/2019", "4/12/2019", "4/15/2019", "4/16/2019", "4/17/2019", "4/18/2019", "4/19/2019", "4/22/2019"],
    datasets: [
        {label: 'Microsoft',
            data: [45, 55, 51, 57, 62, 65, 59, 80, 81, 56, 55, 42, 55, 53, 60, 65],
            borderColor: 'darkblue',
            fill: false
        },
        {label: 'Google',
            data: [128, 148, 140, 119, 186, 127, 160, 125, 142, 155, 153, 160, 140, 137, 155, 160],
            borderColor: 'purple',
            fill: false
        }
    ],
};

var chartOptions = {
    title: {
        display: true,
        text: 'Stock Price Chart',
        fontColor: 'darkblue',
        fontSize: 24
    },
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero: true
            }
        }]
    },
    legend:{
        display:true,
        position:'right',
        labels:{
            fontColor:'black',
            fontSize: 16
        }
    },
    layout: {
        padding: {
            left: 50,
            right: 0,
            top: 0,
            bottom: 0
        }
    }
};



class Chart extends Component{

    constructor (props ) {
        super (props) ;
        this.state = {lineChartData, chartOptions};
        this.chartRef = React.createRef();
    }

    componentDidMount() {
        this.lineChart = new ChartJS(this.chartRef.current, {
            type: 'line',
            data: this.state.lineChartData,
            options: this.state.chartOptions
        });
    }

    render(){
        return(
            <div className="container">
                <canvas id="stockChart" ref={this.chartRef} />
            </div>
        )
    }
}

export default Chart;