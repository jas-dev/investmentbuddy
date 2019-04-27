import React from 'react';
import {reduxForm, Field, reset} from "redux-form";

const AddFunds = props => {
    const {handler, handleSubmit} = props;
    return (
        <form onSubmit={handleSubmit(handler)} className='add-funds-form'>
            <div className='input-field add-funds-input'>
                <label htmlFor='add-funds'>Add Funds</label>
                <Field id='add-funds'
                       name='add-funds'
                       component='input'
                       type='number'/>
            </div>
            <button type='submit' className='confirm btn btn-small black center'>Submit</button>
            <button onClick={(event) => {
                props.dispatch(reset('add-funds-form'));
                event.preventDefault();
                }} className='cancel btn btn-small black center'>Cancel</button>

        </form>
    );
}

// function validate(inputs) {
//     // if errors in inputs, errors.fieldname = text
//     return errors;
// }

export default reduxForm({
    form: 'add-funds-form'
    // , validate
})(AddFunds);
