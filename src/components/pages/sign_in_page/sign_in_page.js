import React, {Component} from 'react';
import SignInForm from '../../account/sign_in_form/sign_in_form';
import SignUpForm from '../../account/sign_up_form/sign_up_form';
import axios from 'axios';
import {signIn} from '../../../actions';
import {connect} from 'react-redux';
import {Field} from "redux-form";

class SignIn extends Component{
    
    handleSignIn = async values => {

        const success = await this.props.signIn(values);

        if(success){
            this.props.history.push('/dashboard');
        } else {
            M.toast({
                html: 'Invalid username or password.'
            });
        }
    }

    handleSignUp(values){
        console.log('sign up form values:', values)
    }

    componentDidMount() {
        const elems = document.querySelectorAll('.collapsible');
        const instances = M.Collapsible.init(elems);
    }

    render() {
        console.log(this.props);

        const {handleSubmit, signIn, reset} = this.props;
        
        return (
            <div className="container row">
                <h1 className='center'>Welcome!</h1>

                <form onSubmit={handleSubmit(signIn)} className='sign_in_form'>
                    <div className="row">
                        <div className="col s12 center">
                            <button className='btn btn-small black'>Sign-In</button>
                            <button className='btn btn-small black' onClick={reset}>Clear</button>
                        </div>
                    </div>
                </form>

                <div className="col s6 offset-s3">
                    <ul className="collapsible">
                        <li className='active'>
                            <div className="collapsible-header">
                                <i className="material-icons">verified_user</i>Sign-In
                            </div>
                            <div className="collapsible-body">
                                <div id="signin" className="row">
                                    <SignInForm signIn={this.handleSignIn}/>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">person_add</i>Create a New Account
                            </div>
                            <div className="collapsible-body">
                                <div id="signup" className="row">
                                    <SignUpForm signUp={this.handleSignUp}/>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        )
    }
}

export default connect(null, {
    signIn: signIn
})(SignIn);

