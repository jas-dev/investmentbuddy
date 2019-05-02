import React from 'react';
import {reduxForm, Field, reset} from "redux-form";

const AddFunds = props => {
    const {handler, handleSubmit} = props;
    return (

        <div className=''>
            <form onSubmit={handleSubmit(handler)} className='add-funds-form'>
                <div className="row">
                    <div className='input-field add-funds-input col s8 offset-s2 center'>
                        <label htmlFor='add-funds'>$</label>
                        <Field id='add-funds'
                               name='amount'
                               component='input'
                               type='number'/>
                    </div>
                </div>

                <div className="row">
                    <div className="col s6 center">
                        <button type='submit' className='confirm btn-small green darken-4'>
                            <i className="material-icons left">add</i>Add
                        </button>
                    </div>

                    <div className='col s6 center'>
                        <button onClick={(event) => {
                            props.dispatch(reset('add-funds-form'));
                            event.preventDefault();
                        }} className='cancel btn-small green darken-4'>
                            <i className="material-icons left">close</i>Clear
                        </button>
                    </div>
                </div>
            </form>
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
