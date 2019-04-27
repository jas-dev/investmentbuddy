import React from 'react';
import {reduxForm, Field, reset} from "redux-form";

const AddFunds = props => {
    const {handler, handleSubmit} = props;
    return (
        <form onSubmit={handleSubmit(handler)} className='add-funds-form'>
            <div className='input-field add-funds-input'>
                <label htmlFor='add-funds'>Add Funds</label>
                <Field id='add-funds'
                       name='amount'
                       component='input'
                       type='number'/>
            </div>
            <button type='submit' className='confirm btn btn-small black center'>Add</button>
            <button onClick={(event) => {
                props.dispatch(reset('add-funds-form'));
                event.preventDefault();
                }} className='cancel btn btn-small black center'>Clear</button>

        </form>
    );
}

function validate(inputs) {
    const errors = {};

    // check if inputs.funds is an actual number here
    // if (check fails)
    //     errors.funds = 'error text here'

    // uncomment the line below in export if using validate

    return errors;
}

export default reduxForm({
    form: 'add-funds-form'
    // , validate
})(AddFunds);
