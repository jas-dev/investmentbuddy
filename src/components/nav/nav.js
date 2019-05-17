import React, {Component, Fragment} from 'react';
import {NavLink, Link} from 'react-router-dom';
import SideNav from './sidenav';
import './nav.scss'
import {connect} from 'react-redux';


class Nav extends Component{
    returnLinks(signedIn){

        const navlinkStyle = {
            "background-color": "#153a15",
            "color": "white"
        };

        if (signedIn){
            return (
                <Fragment>
                    <li className='sidenav-close'>
                        <NavLink to='/dashboard' activeStyle={navlinkStyle}>Dashboard</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/portfolio' activeStyle={navlinkStyle}>Portfolio</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/stocks' activeStyle={navlinkStyle}>Browse Stocks</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/transactions' activeStyle={navlinkStyle}>Transactions</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/home' activeStyle={navlinkStyle}>Home</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/account/sign-out' activeStyle={navlinkStyle}>Sign Out</NavLink>
                    </li>
                </Fragment>
            );
        } else {
            return (
                <Fragment>
                    <li className='sidenav-close'>
                        <NavLink to='/home' activeStyle={navlinkStyle}>Home</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/stocks' activeStyle={navlinkStyle}>Browse Stocks</NavLink>
                    </li>
                    <li className='sidenav-close'>
                        <NavLink to='/account/sign-in' activeStyle={navlinkStyle}>Sign in</NavLink>
                    </li>
                </Fragment>
            );
        }
    }


    render() {
        const links = this.returnLinks(this.props.signedIn);

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


function mapStateToProps(state){ /*whatever we return here will be mapped to props*/
    return {
        signedIn: state.user.auth
    }
}

export default connect(mapStateToProps)(Nav);


