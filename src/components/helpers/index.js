export function formatHistory(stock){
    const xData = Object.keys(stock.history);
    const yData = [];

    for (let index=0; index<xData.length; index++){
        yData.push(parseFloat(stock.history[xData[index]]));
    }

    const symbol = stock.company.symbol;

    return {
        "symbol": symbol,
        "xData": xData, 
        "yData": yData
    };
}


