import React, {Component} from 'react';
import SignInForm from '../../account/sign_in_form/sign_in_form';
import SignUpForm from '../../account/sign_up_form/sign_up_form';
import axios from 'axios';
import {signIn} from '../../../actions';
import {connect} from 'react-redux';

class SignIn extends Component{
    
    handleSignIn = values => {
        axios.post('/api/login.php', values).then(resp => {

            if (resp.data.success) {
                localStorage.setItem("investmentBuddy", resp.data.userData.token);
                this.props.signIn();
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

    componentDidMount() {
        var instance = M.Tabs.init(this.tabs);
    }

    render() {
        console.log(this.props);
        return (
            <div className="row container">
                <div className="col s6 offset-s3 card">
                    <ul className="tabs" ref={element=> {
                        this.tabs = element
                    }}>
                        <li className="tab col s6 black-text"><a className="active" href="#signin">Sign-In</a></li>
                        <li className="tab col s6"><a className="active" href="#signup">Sign-Up</a></li>
                    </ul>
                </div>
                <div id="signin" className="row">
                    <SignInForm signIn={this.handleSignIn}/>
                </div>
                <div id="signup" className="row">
                    <SignUpForm signUp={this.handleSignUp}/>
                </div>
            </div>

        )
    }
}

export default connect(null, {
    signIn: signIn
})(SignIn);

