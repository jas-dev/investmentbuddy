import React, {Component} from 'react';
import SignInForm from '../../account/sign_in_form/sign_in_form';
import SignUpForm from '../../account/sign_up_form/sign_up_form';
import axios from 'axios'
import {signIn} from '../../../actions';
import {connect} from 'react-redux';

class SignIn extends Component{
    handleSignIn = values => {
        axios.post('/api/login.php', values).then(resp => {
console.log(resp);
            if (resp.data.success) {
                this.props.signIn(resp.data.userData);
                this.props.history.push('/dashboard');
            } else {
                M.toast({
                    html: 'Invalid username or password.'
                });
            }
        });
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

export default connect(null, {
    signIn: signIn
})(SignIn);

