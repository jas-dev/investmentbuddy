import React from 'react';
import {reduxForm, Field} from 'redux-form';

const MakeTradesForm = props => {
    const {callback, handleSubmit, style} = props;

    return (
        <form onSubmit={handleSubmit(callback)} className='trade-form'>
            <div>
                <label htmlFor='accountNum'>Account Number</label>
                <Field name='accountNum' component='input' type='text'/>
            </div>
            <div>
                <label>
                    <Field name='trade-type' component='input' type='radio' value='buy' checked/>
                    <span>Buy</span>
                </label>
                <label>
                    <Field name='trade-type' component='input' type='radio' value='sell'/>
                    <span>Sell</span>
                </label>
            </div>

        </form>
    );
}

function validate(inputs) {
    // if errors, errors.fieldname = text
    return {};
}

export default reduxForm({
    form: 'make-trades-form',
    validate
})(MakeTradesForm);