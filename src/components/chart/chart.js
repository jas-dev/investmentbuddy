import React, {Component} from 'react';

class Chart extends Component{

var demoChart = $("#demoChart");

var data = {
  labels : [<?php echo $json_output[date];?>],
  datapts : [{
      label : "Stock Performance Chart",
      data : [<?php echo $json_output[close]; ?>],
      backgroundColor: "blue",
      borderColor: "black",
      fill: false,
      lineTension: 0.02,
      pointRadius: 5,
      pointBorderWidth: 3
  }]
};

var options = {
    title : {
        display: false,
        position: "top",
        text: "Performance Chart",
        fontSize : 14,
        fontColor : "#111"
    },
    legend : {
        display : true,
        position : "bottom"
    }
}
    var $chart = new Chart(demoChart, {
        type: 'line',
        data: data,
        options: {
            elements: {
                line: {
                    tension: 0 // disables bezier curves
                }
            }
        }
    });


    render(){
        return(
            <div className='center'>
               // |/\/\/\.$Chart
            $chart
            </div>
        )
    }
}

export default Chart;