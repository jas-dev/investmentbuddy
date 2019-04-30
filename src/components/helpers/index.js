import React from 'react';
import RenderTable from '../render_table/render_table';


export function formatHistory(stock){
    
    const xData = Object.keys(stock.history);
    const yData = [];

    const reorderXData = [];
    for (let reorderIndex=xData.length-1; reorderIndex>=0; reorderIndex--){
        reorderXData.push(xData[reorderIndex]);
    }

    for (let index=0; index<reorderXData.length; index++){
        yData.push(parseFloat(stock.history[reorderXData[index]]));
    }

    const symbol = stock.company.symbol;
    const name = stock.company.name;
    const label = `${symbol} - ${name}`;

    return {
        "label": label,
        "xData": reorderXData, 
        "yData": yData
    };
}

export function formatHeaders(str){
    if (str===""){
        return str;
    } else if (str==="timestamp"){
        return "Last Updated";
    }
    const arr = str.split("");
    let firstLetter = arr[0];

    firstLetter = firstLetter.toUpperCase();
    arr[0] = firstLetter;
    for (let index=1; index<arr.length; index++){
        if (arr[index]===arr[index].toUpperCase() && arr[index]!=="_"){
            arr.splice(index, 0, " ");
            break;
        } else if (arr[index]==="_"){
            arr[index]=" ";
            arr[index+1] = arr[index+1].toUpperCase();
            break;
        }
    }

    return arr.join("");
}

export function convertAccountData(props){
    const {availBalance,totalAsset,availToTrade} = props;

}


