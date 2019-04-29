import React from 'react';
import SignInForm from '../../account/sign_in_form/sign_in_form';
import SignUpForm from '../../account/sign_up_form/sign_up_form';

export default props =>{
    return (
        <div className='container'>
            <div className='row'>
                <h1 className='col s6 center'>Sign In</h1>
                <h1 className='col s6 center'>Sign Up</h1>
                <SignInForm/>
                <SignUpForm/>
            </div>
        </div>
    )
}