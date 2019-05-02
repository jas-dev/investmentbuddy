import React, {Component, Fragment} from 'react';
import {Link} from 'react-router-dom';
import SideNav from './sidenav';
import './nav.scss'
import {connect} from 'react-redux';
import axios from 'axios';

class Nav extends Component{
    constructor(props){
        super(props);
        this.state = {
            links: null
        };
    }

    componentDidMount(){
        this.checkLogIn();
    }

    returnLinks(signedIn){
        if (signedIn){
            return (
                <Fragment>
                    <li className='.sidenav-close'>
                        <Link to='/dashboard'>Dashboard</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/trade'>Enter Trades</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/portfolio'>Portfolio</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/stocks'>All Stocks</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/transactions'>Transactions</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/home'>Home</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/about'>About</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/faq'>FAQ</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/account/sign-out'>Sign Out</Link>
                    </li>
                </Fragment>
            );
        } else {
            return (
                <Fragment>
                    <li className='sidenav-close'>
                        <Link to='/home'>Home</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/about'>About</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/faq'>FAQ</Link>
                    </li>
                    <li className='sidenav-close'>
                        <Link to='/account/sign-in'>Sign in</Link>
                    </li>
                </Fragment>
            );
        }
    }

    renderLinks(signedIn){
        this.setState({
            links: this.returnLinks(signedIn)
        });
    }

    async checkLogIn(){
        let signedIn;
        const token = localStorage.getItem("investmentBuddy");
    
        if (token===null){
            signedIn = false;
        } else {
            let success = await axios.post("/api/checkloggedin.php", {
                token: token
            });
            if (success.data.success){
                signedIn = true;
            } else {
                signedIn = false;
            }
        }
        this.renderLinks(signedIn);


    }

    render() {
        
        const links = this.state.links;
        if (this.state.links===null){
            return null;
        } else {
        return (
            <Fragment>
                <div className='navbar-fixed'>
                    <nav className='nav'>
                        <div className='nav-wrapper'>
                            <a href='#' data-target='sidenav' className='sidenav-trigger'>
                                <i className='material-icons'>menu</i>
                            </a>

                            <Link className='brand-logo' to='/home'>
                                InvestmentBuddy
                            </Link>

                            <ul className='right hide-on-med-and-down'>
                                {links}
                            </ul>
                        </div>
                    </nav>
                </div>
                <SideNav links={links}/>
            </Fragment>
        );
    }
}
}

function mapStateToProps(state){ /*whatever we return here will be mapped to props*/
    return {
        signedIn: state.user.auth
    }
}

export default connect(mapStateToProps)(Nav);


