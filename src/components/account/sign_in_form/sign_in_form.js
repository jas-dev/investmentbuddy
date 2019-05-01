import React, {Component} from 'react';
import {reduxForm, Field, reset} from 'redux-form';

class SignInForm extends Component{

    render(){
        const {handleSubmit, signIn} = this.props;

        return (
            <div className='col s6 container'>
                <div className='card card-padout'>
                    <form onSubmit={handleSubmit(signIn)} className='sign_in_form'>
                        <div className='input-field'>
                            <Field id='name'
                                   name='name'
                                   type='text' component='input'/>
                            <label htmlFor='name'>Name</label>
                        </div>
                        <div className='input-field'>
                            <Field id='password' name='password' type='text' component='input'/>
                            <label htmlFor='password'>Password</label>
                        </div>
                        <div className="row">
                            <div className="col s12 center">
                                <button className='btn btn-small black'>Sign-In</button>
                                <button className='btn btn-small black' onClick={(event) => {
                                    this.props.dispatch(reset('sign_in_form'));
                                    event.preventDefault();
                                }}>Clear</button>
                            </div>
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
