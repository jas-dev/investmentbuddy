import React, {Component, Fragment} from 'react';
import {Link} from 'react-router-dom';
import SideNav from './sidenav';
import './nav.scss'


class Nav extends Component{
    constructor(props){
        super(props);
        this.state = {
            signedIn: true
        }
    }
    renderLinks(){
        if (this.state.signedIn){
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
                        <Link to='/sign-out'>Sign Out</Link>
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
                        <Link to='/sign-in'>Sign in</Link>
                    </li>
                </Fragment>
            );
        }


    }

    render() {
        const links = this.renderLinks();
        return (
            <Fragment>
                <div className='navbar-fixed'>
                    <nav className='nav'>
                        <div className='nav-wrapper'>
                            <a href='#' data-target='sidenav' className='sidenav-trigger'>
                                <i className='material-icons'>menu</i>
                            </a>

                            <Link className='brand-logo' to='/home'>
                                MoneyTrainer
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

export default Nav;