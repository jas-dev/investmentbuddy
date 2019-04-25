import React, {Fragment} from 'react';

export default props =>{
    //if receiving data from get stocks

    const headingKey = props.headings.map( key=>{
        return(
            <th>{key}</th>
        )
    });
    //if receiving data from get transactions

    //if receiving data from get account data

    return (
       <Fragment>
           {headingKey}
       </Fragment>
    );
}

/*<li className="collection-item product-item hoverable" onClick={() => { goToDetails()}}>
            <p className="title">{symbol}</p>
            <div className='row center'>

                <div className="col s4">
                    <span>Last Updated: {date}</span>
                </div>
                <div className="col s4">
                    <span>Gain/Loss: {performance} </span>
                </div>
                <div className="col s4">
                    <span>Price: {price} </span>
                </div>
            </div>

        </li>*/