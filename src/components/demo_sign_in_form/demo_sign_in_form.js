import React, {Component} from 'react';
import {reduxForm} from 'redux-form';

class DemoSignInForm extends Component{

    render(){
        const {handleSubmit, signInDemo } = this.props;

        return(
            <div className='col s12'>
                <form onSubmit={handleSubmit(signInDemo)} className='demo_sign_in_form'>
                    <div className="row">
                        <div className="col s12 center">
                            <button className='btn btn-large green darken-4'>Demo Sign-In</button>
                        </div>
                    </div>
                </form>
            </div>
        )
    }
}

export default reduxForm({
    form: 'demo_sign_in_form'
})(DemoSignInForm);
