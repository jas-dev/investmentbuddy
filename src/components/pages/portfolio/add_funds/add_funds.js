import React from 'react';
import {reduxForm, Field, reset} from "redux-form";

const AddFunds = props => {
    const {handler, handleSubmit} = props;
    return (
        <div className="row card card-padout">
            <div className='col s12'>
                <form onSubmit={handleSubmit(handler)} className='add-funds-form'>
                    <div className='input-field add-funds-input'>
                        <label htmlFor='add-funds'>Add Funds</label>
                        <Field id='add-funds'
                               name='amount'
                               component='input'
                               type='number'/>
                    </div>
                    <div className="row">
                        <button type='submit' className='col s4 offset-s1 confirm btn btn green darken-2 center'>Add</button>
                        <button onClick={(event) => {
                            props.dispatch(reset('add-funds-form'));
                            event.preventDefault();
                        }} className='col s4 offset-s2 cancel btn btn green darken-2 center'>Clear</button>
                    </div>
                </form>
            </div>
        </div>

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
