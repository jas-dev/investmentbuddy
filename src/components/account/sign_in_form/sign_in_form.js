import React, {Component} from 'react';
import {reduxForm, Field} from 'redux-form';

class SignInForm extends Component{

    render(){

        const {handleSubmit, signIn, reset} = this.props;

        return (
            <div className='col s12'>
                <div className=''>
                    <form onSubmit={handleSubmit(signIn)} className='sign_in_form'>
                        <div className='input-field'>
                            <Field id='name'
                                   name='name'
                                   type='text'
                                   component='input'/>
                            <label htmlFor='name'>Username</label>
                        </div>
                        <div className='input-field'>
                            <Field id='password'
                                   name='password'
                                   type='password'
                                   component='input'/>
                            <label htmlFor='password'>Password</label>
                        </div>
                            <div className="col s12 center">
                                <button className='signinbtn btn btn-small black'>Sign-In</button>
                                <button className='clearbtn btn btn-small black' onClick={reset}>Clear</button>
                            </div>
                    </form>
                </div>
            </div>
        );
    }
}

export default reduxForm({
    form: 'sign_in_form'
})(SignInForm);
