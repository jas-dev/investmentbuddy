import React, {Component} from 'react';
import {connect} from 'react-redux';
import Axios from 'axios';


export default function(WrappedComponent, to = '/account/sign-in', requireAuth= true){
    class Auth extends Component {
        componentDidMount(){
            this.checkAuth()
        }

        async checkAuth(){

            var userAuthToken = null;

            if(localStorage.investmentBuddy){
                userAuthToken = localStorage.investmentBuddy;
            }else if(sessionStorage.investmentBuddy){
                userAuthToken = sessionStorage.investmentBuddy;
            }

            let authStatus = null;

            if(userAuthToken !== null){
                authStatus = await Axios.post("/api/checkloggedin.php", {
                    token: userAuthToken
                });
            }

            if((!authStatus && requireAuth) || (authStatus&& authStatus.data.success !== requireAuth)){

                this.props.history.push(to);
            }

        }

        render() {
            return <WrappedComponent {...this.props}/>;
        }
    }

    function mapStateToProps(state){
        return{
            auth: state.user.auth
        }
    }

    return connect(mapStateToProps)(Auth);
}

