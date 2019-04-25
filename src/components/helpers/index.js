export function formatHistory(stock){
    console.log(stock);
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

export function capitalize(str){
    const arr = str.split("");
    let firstLetter = arr[0];

    firstLetter = firstLetter.toUpperCase();
    arr[0] = firstLetter;
    return arr.join("");
}
