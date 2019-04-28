import React, {Component, Fragment} from 'react';
import {Link} from 'react-router-dom';
import SideNav from './sidenav';
import Search from '../search/search'
import './nav.scss'
import Logo from '../../../public/dist/assets/images/stock_logo.jpg'

class Nav extends Component{
    renderLinks(){
        return (
            <Fragment>
                <li className='.sidenav-close'>
                    <Link to='/dashboard'>Dashboard</Link>
                </li>
                <li className='sidenav-close'>
                    <Link to='/trade'>Make Trades</Link>
                </li>
                <li className='sidenav-close'>
                    <Link to='/portfolio'>Portfolio</Link>
                </li>
                <li className='sidenav-close'>
                    <Link to='/stocks'>All Stocks</Link>
                </li>
                <li className='sidenav-close'>
                    <Link to='/stockdetails'>Stock Details</Link>
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
                    <Link to='/sign-up'>Sign up</Link>
                </li>
                <li className='sidenav-close'>
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