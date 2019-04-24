import React, {Component, Fragment} from 'react';
import {Link} from 'react-router-dom';
import SideNav from './sidenav';
import Search from '../search/search'
import './nav.scss'
import Logo from '../../assets/images/moneybag.png'

class Nav extends Component{
    renderLinks(){
        return (
            <Fragment>
                <li>
                    <Link to='/dashboard'>Dashboard</Link>
                </li>
                <li>
                    <Link to='/trade'>Make Trades</Link>
                </li>
                <li>
                    <Link to='/portfolio'>Portfolio</Link>
                </li>
                <li>
                    <Link to='/stocks'>All Stocks</Link>
                </li>
                <li>
                    <Link to='/stocksdetails'>Stock Details</Link>
                </li>
                <li>
                    <Link to='/transactions'>Transactions</Link>
                </li>
                <li>
                    <Link to='/home'>Home</Link>
                </li>
                <li>
                    <Link to='/about'>About</Link>
                </li>
                <li>
                    <Link to='/faq'>FAQ</Link>
                </li>

                <li>
                    <Link to='/sign-up'>Sign up</Link>
                </li>
                <li>
                    <Link to='/sign-in'>Sign in</Link>
                </li>
            </Fragment>

        )

    }

    render() {
        const links = this.renderLinks();
        return (
            <Fragment>
                <nav className='nav'>
                    <div className='nav-wrapper'>
                        <a href='#' data-target='sidenav' className='sidenav-trigger'>
                            <i className='material-icons'>menu</i>
                        </a>

                        <Link className='brand-logo' to='/home'>
                            <img src={Logo}/>

                        </Link>

                        <ul className='right hide-on-med-and-down'>
                            {links}
                        </ul>
                    </div>
                </nav>
                <SideNav links={links}/>
            </Fragment>
        );
    }
}

export default Nav;