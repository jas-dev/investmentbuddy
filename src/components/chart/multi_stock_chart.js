import React, {Component} from 'react';
import './chart.scss';
import ChartJS from 'chart.js';

class MultiStockChart extends Component{

    constructor (props) {
        super (props);

        let chartOptions = {
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
            legend: {
                display: true
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

        chartOptions.title.text = "Market Index Performance";

        this.state = {
            lineChartData:
                 {
                 labels: this.props.symbolDataList[0].xData,
                 datasets: [
                     {
                         label: this.props.symbolDataList[0].label,
                         data: this.props.symbolDataList[0].yData,
                         borderColor: 'darkred',
                         fill: false
                     },
                     {
                         label: this.props.symbolDataList[1].label,
                         data: this.props.symbolDataList[1].yData,
                         borderColor: 'darkblue',
                         fill: false
                     },
                     {
                         label: this.props.symbolDataList[2].label,
                         data: this.props.symbolDataList[2].yData,
                         borderColor: 'darkgreen',
                         fill: false
                     }
                     ]
             },
            chartOptions
        };
        this.chartRef = React.createRef();
    }

    componentDidMount() {
        // this.getData();
        this.lineChart = new ChartJS(this.chartRef.current, {
            type: 'line',
            data: this.state.lineChartData,
            options: this.state.chartOptions
        });
    }

    render(){
        console.log('state', this.state)
        return(
            <div>
                <canvas id="stockChart" ref={this.chartRef} />
            </div>
        )
    }
}


export default MultiStockChart;


