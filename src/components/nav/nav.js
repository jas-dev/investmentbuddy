import React, {Component, Fragment} from 'react';
import {Link} from 'react-router-dom';
import SideNav from './sidenav';
import './nav.scss'
import {connect} from 'react-redux';

class Nav extends Component{


    renderLinks(){
        if (this.props.signedIn){
            return (
                <Fragment>
                    <li className='.sidenav-close'>
                        <Link to='/dashboard'>Dashboard</Link>
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


