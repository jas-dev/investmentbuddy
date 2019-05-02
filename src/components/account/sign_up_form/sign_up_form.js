import React from 'react';
import {reduxForm, Field, reset} from 'redux-form';

const SignUpForm = props =>{

    const {handleSubmit, signUp} = props;

    return(
        <div className="col s6 offset-s3">
            <div className="card card-padout">
                <form onSubmit={handleSubmit(signUp)} className='sign_up_form'>
                    <div className='input-field'>
                        <Field component='input'
                               id='signUpName'
                               name='name'
                               type='text'
                        />
                        <label htmlFor='signUpName'>Name</label>
                    </div>

                    <div className='input-field'>
                        <Field component='input'
                               id='signUpPassword'
                               name='password'
                               type='password'
                        />
                        <label htmlFor='signUpPassword'>Create Password</label>
                    </div>

                    <div className="row">
                        <div className="col s12 center">
                            <button className='confirm btn btn-small black'>Submit</button>
                            <button className='cancel btn btn-small black' onClick={(event) => {
                                props.dispatch(reset('sign_up_form'));
                                event.preventDefault();
                            }}>Clear</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    );
};

export default reduxForm({
    form: 'sign_up_form'
})(SignUpForm);