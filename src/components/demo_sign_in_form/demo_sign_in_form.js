import React, {Component} from 'react';
import {reduxForm, Field} from 'redux-form';

class DemoSignInForm extends Component{

    render(){
        const {handleSubmit, signInDemo, reset} = this.props;

        return(
            <div className='col s12'>
                <div className=''>
                    <form onSubmit={handleSubmit(signInDemo)} className='demo_sign_in_form'>
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
                        <div className="row">
                            <div className="col s12 center">
                                <button className='btn btn-small black'>Demo Sign-In</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        )
    }
}

export default reduxForm({
    form: 'demo_sign_in_form'
})(DemoSignInForm);
