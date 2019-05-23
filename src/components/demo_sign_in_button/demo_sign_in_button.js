import React, {Component} from 'react';
import {signInDemo} from '../../actions';
import {connect} from 'react-redux';

class DemoSignInButton extends Component{

    handleSignIn = async values => {

        const success = await this.props.signIn(values);

        if(success){
            this.props.history.push('/dashboard');
        } else {
            M.toast({
                html: 'Invalid username or password.'
            });
        }
    };

    render(){

        return(
            <button className="demo" onClick={signInDemo({
                    name: 'demo',
                    password: 'demo'
            })}>Demo User Sign-In</button>
        )

    }
}

export default connect(null, {
    signIn: signInDemo
})(DemoSignInButton);
