import React from 'react';
import './sign_up_form.scss'


const SignUpForm = props =>{

    console.log('sign in form props:', props);
    return(
        <form>
            <div className='input-field container'>
                <input className='input' id='email' name='email' type='text'/>
                <label htmlFor='email'>Email</label>
            </div>
            <div className='input-field container'>
                <input className='input' id='account-name' name='account-name' type='text'/>
                <label htmlFor='account'>Choose an Account Name</label>
            </div>
            <div className='input-field container'>
                <input id='password' name='password' type='text' className=''/>
                <label htmlFor='password'>Create a Password</label>
            </div>
            <div className='container'>
                <button className='confirm btn btn-small black left'>Submit</button>
                <button className='cancel btn btn-small black left'>Cancel</button>
            </div>
        </form>
    );
};

export default SignUpForm;