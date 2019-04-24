import React from 'react';
import './sign_in.scss';


const SignInForm = props =>{

    console.log('sign in form props:', props);
    return(
        <form>
            <div className='input-field container'>
                <input className='input' id='email' name='email' type='text'/>
                <label htmlFor='email'>Email</label>
            </div>
            <div className='input-field container'>
                <input id='password' name='password' type='text' className=''/>
                <label htmlFor='password'>Password</label>
            </div>
            <button className='btn btn-small black'>Sign In</button>
        </form>
    );
};

export default SignInForm;