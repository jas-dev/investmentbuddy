import React from 'react';
import RenderTable from '../render_table/render_table';
import { COPYFILE_FICLONE_FORCE } from 'constants';


export function formatMarketIndex(stocks) {
    const linesData = [];

    stocks.symbols.forEach(function(symbol, symbolIndex, symbols) {
        const symbolData = stocks.prices[symbolIndex];
        const xData = Object.keys(symbolData);
        const yData = [];

        for (let index=0; index<xData.length; index++){
            yData.push(parseFloat(stocks.prices[symbolIndex][xData[index]]));
        }

        linesData.push({
            "label": stocks.symbols[symbolIndex],
            "xData": xData,
            "yData": yData
        });
    });
    return linesData;
}

export function formatHistory(stock, type){
    console.log(stock);
    let xData = [];
    let yData = [];
    if (type==="price"){
        xData = Object.keys(stock.priceHistory);
    } else if (type==="percent"){
        xData = Object.keys(stock.percentHistory);
    }
    let reorderXData = [];
    for (let reorderIndex=xData.length-1; reorderIndex>=0; reorderIndex--){
        reorderXData.push(xData[reorderIndex]);
    }

    for (let index=0; index<reorderXData.length; index++){
        if (type==="price"){
            yData.push(parseFloat(stock.priceHistory[reorderXData[index]]));
        } else if (type==="percent"){
            yData.push(parseFloat(stock.percentHistory[reorderXData[index]]));
        }
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
    } else if (str==="unrealized"){
        return "Urealized P/L";
    } else if (str==="realizedPl"){
        return "Realized P/L";
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

export function formatDateTime(str){
    if (str===null){
        return "N/A";
    }
    const arr = str.split(" ");

    const dateString = arr[0];
    const dateArray = dateString.split("-");
    
    if (dateArray[1][0]==="0"){
        dateArray[1] = dateArray[1][1];
    }
    let formattedDateString = dateArray[1]+"/"+dateArray[2]+"/"+dateArray[0];
    let timeString;

    if (typeof arr[1] === "undefined"){
        return formattedDateString;
    } else {
    timeString = arr[1]; }
    if (timeString==="00:00:00"){
        return formattedDateString;
    }
    const timeArray = timeString.split(":");
    if (timeArray[0]>12){
        timeArray[0]-=12;
    }
    formattedDateString += (", "+timeArray[0]+":"+timeArray[1]+":"+timeArray[2]);

    return formattedDateString;
}


export function randomizeStocks(arr){
    let result = [];
    for (let index=0; index<arr.length; index++){
        let randomStock = Math.floor(Math.random()*(arr.length-1));
        result.push(arr[randomStock]);
        arr.slice(index, 1);
    }

    return result;
}

export function moneyCommas(num){
    let str = num.toString();
    let arr = str.split("");

    let decimal = false;
    let startIndex = arr.length-1;
    for (let index=0; index<arr.length; index++){
        if (arr[index]==="."){
            decimal = true;
            startIndex=index-1;
        }
    }

    let counter = 1;
 
    for (let index=startIndex; index>=0; index--){
        if (counter%3===0 && (arr[index-1]!=="-"&&typeof arr[index-1]!=="undefined")){
            arr.splice(index, 0, ",");
        }
        counter++;
    }

    const result = arr.join("");
    return result;
}


export function formatNegativeMoney(num){
    let str = num.toString();
    let arr = str.split("");
    arr.splice(1, 0, "$");

    const result = arr.join("");
    return result;
}

