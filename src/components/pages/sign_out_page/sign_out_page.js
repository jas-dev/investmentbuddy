import React, {Component} from 'react';
import {connect} from 'react-redux';
import {signOut} from "../../../actions";

class SignOut extends Component{
    componentDidMount() {
        this.props.signOut();
    }

    render() {
        return (
            <div className='sign-out'>
                <div className='sign-out-header center'>
                    <h1 className='center'>Your session has ended.</h1>
                    <h4>You have been signed out.</h4>
                </div>
            </div>
        )
    }
}

export default connect(null, {
    signOut: signOut
})(SignOut);