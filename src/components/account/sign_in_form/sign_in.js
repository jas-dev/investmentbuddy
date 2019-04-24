import React, {Component} from 'react';
import SignInForm from './sign_in_form';


class SignIn extends Component{
    handleSignIn = (values)=>{
        console.log('Form Values:',values);

        this.props.signIn(values);
    };

    render(){
        return (
            <div>
                <h1 className="center">Sign In</h1>
                <SignInForm signIn={this.handleSignIn}/>
            </div>
        );
    }
}
export default SignIn
