import React, {Component} from 'react';
import {connect} from 'react-redux';
import Axios from 'axios';


export default function(WrappedComponent, to= '/account/sign-in', requireAuth = true){
    class Auth extends Component {
        componentDidMount(){
            this.checkAuth()
        }

        componentDidUpdate(){
            this.checkAuth();
        }

        async checkAuth(){
            let userAuthToken = localStorage.investmentBuddy;
            let authStatus = await Axios.post("/api/checkloggedin.php", {
                token: userAuthToken
            });
            
            if(authStatus.data.success !== requireAuth){
                this.props.history.push(to);
            } else {
                
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

