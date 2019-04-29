import React, {Component} from 'react';
import SignInForm from '../../account/sign_in_form/sign_in_form';
import SignUpForm from '../../account/sign_up_form/sign_up_form';

class SignIn extends Component{
    handleSignIn(values){
        console.log('sign in form values:', values);

    }

    handleSignUp(values){
        console.log('sign up form values:', values)
    }

    render() {
        return (
            <div className='container'>
                <div className='row'>
                    <h1 className='col s6 center'>Sign In</h1>
                    <h1 className='col s6 center'>Sign Up</h1>
                    <SignInForm signIn={this.handleSignIn}/>
                    <SignUpForm signUp={this.handleSignUp}/>
                </div>
            </div>
        )
    }
}

export default SignIn;