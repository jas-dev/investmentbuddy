import React from 'react';
import {reduxForm, Field} from "redux-form";

const AddToWatchlistForm = props => {
    const {handler, handleSubmit} = props;
    return (
        <form onSubmit={handleSubmit(handler)} className='watchlist-add-form row valign-wrapper'>
                <div className='input-field watchlist-add-input col s6'>
                    <label htmlFor='watchlist-add-field'>Symbol</label>
                    <Field id='watchlist-add-field'
                           name='symbol'
                           component='input'
                           type='text'/>
                </div>
                <button className="btn green darken-2">Add to watchlist
                    <i className="material-icons left">add</i>
                </button>
        </form>
    );
}

function validate(inputs) {
    const errors = {};

    // validate symbol here, if necessary
    // if (check fails)
    //     errors.fieldname = 'error text here'

    // uncomment the line below in export if using validate

    return errors;
}

export default reduxForm({
    form: 'add-to-watchlist-form'
    // , validate
})(AddToWatchlistForm);