import React from 'react';
import './make_trades.scss';

export default props =>{
    return (
        <div className='trade-form container'>
            <h5>Make Trades</h5>
            <div className='divider'/>
            <form>
                <div className='row card'>
                    <div className='col s6'>
                        Account
                    </div>
                    <div className='col s3'>
                        <input placeholder='{account number}'/>
                    </div>
                    <div className='col s6'>
                        Transaction Type
                    </div>
                    <div className='col s6'>
                        <p className='col s3'>
                            <label>
                                <input className="with-gap" name="trade" type="radio" checked/>
                                <span>Buy</span>
                            </label>
                        </p>
                        <p className='col s3'>
                            <label>
                                <input className="with-gap" name="trade" type="radio" checked/>
                                <span>Sell</span>
                            </label>
                        </p>
                    </div>
                    <div className='col s6'>
                        Symbol
                    </div>
                    <div className='col s6'>
                        <input placeholder='enter symbol'/>
                    </div>
                    <div className='col s6'>
                        Shares
                    </div>
                    <div className='col s6'>
                        <input placeholder='number of shares'/>
                    </div>
                    <div className="col s12">
                        <button className='btn btn-small black center'>Confirm Trade</button>
                    </div>

                </div>
            </form>
        </div>
    )
}