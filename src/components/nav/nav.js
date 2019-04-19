import React, {Component, Fragment} from 'react';
import {Link} from 'react-router-dom';
import SideNav from './sidenav';
import './nav.scss'

class Nav extends Component{
    renderLinks(){
        return (
            <Fragment>
                <li>
                    <Link to='/home'>Home</Link>
                </li>
                <li>
                    <Link to='/about'>About</Link>
                </li>
                <li>
                    <Link to='/stocksdetails'>Stocks Details</Link>
                </li>
                <li>
                    <Link to='/portfolio'>Manage Portfolio</Link>
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
                        Investment Buddy
                      </Link>
                      <ul className='right hide-on-med-and-down'>
                        {this.renderLinks()}
                      </ul>
                  </div>
              </nav>

              <SideNav links={links}/>
          </Fragment>
       );
   }
}

export default Nav;