import React from 'react';
import {reduxForm, Field} from 'redux-form';

const EnterTradesForm = props => {
    const {handler, handleSubmit} = props;
    return (

        <form onSubmit={handleSubmit(handler)} className='trade-form'>

            <div className="row type-wrapper">
                <span className='col s2 offset-s1'>Type</span>
                <label className='col s2 offset-s2'>
                    <Field name='buy_sell' component='input' type='radio' value='B'/>
                    <span>Buy</span>
                </label>
                <label className='col s2 offset-s2'>
                    <Field name='buy_sell' component='input' type='radio' value='S'/>
                    <span>Sell</span>
                </label>
            </div>

            <div className='row symbol-shares'>
                <div className="input-field col s2 offset-s1">
                    <label htmlFor='symbol-field'>Symbol</label>
                    <Field id='symbol-field'
                           name='symbol'
                           component='input'
                           type='text'/>
                </div>
                <div className="input-field col s3 offset-s1">
                    <label htmlFor='price-field'>Price</label>
                    <Field id='price-field'
                           name='price'
                           component='input'
                           type='number'/>
                </div>
                <div className="input-field col s2 offset-s1">
                    <label htmlFor='shares-field'>Shares</label>
                    <Field id='shares-field'
                           name='shares'
                           component='input'
                           type='number'/>
                </div>
            </div>

            <div className="row">
                <div className="col s12 center">
                    <button className="btn green darken-2 center">Submit</button>
                </div>
            </div>


        </form>
    );
}

function validate(inputs) {
    const errors = {};

    // check if input fields are legal
    // if (check fails)
    //     errors.fieldname = 'error text here'

    // uncomment the line below in export if using validate

    return errors;
}

export default reduxForm({
    form: 'enter-trades-form'
    // , validate
})(EnterTradesForm);