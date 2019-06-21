import React from 'react';
import {reduxForm, Field} from "redux-form";

const AddToWatchlistForm = props => {
    const {handler, handleSubmit} = props;
    return (
        <form onSubmit={handleSubmit(handler)} className='watchlist-add-form row valign-wrapper right'>
                <div className='input-field watchlist-add-input col s6'>
                    <label htmlFor='watchlist-add-field'>Add Symbol</label>
                    <Field id='watchlist-add-field'
                           name='symbol'
                           component='input'
                           type='search'/>
                </div>
                <button className="btn-floating btn waves-effect waves-light green darken-4 ">
                   <a><i className="material-icons">add</i></a>
                </button>

        </form>
    );
};

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