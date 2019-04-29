import React, {Component} from 'react';


class SideNav extends Component{
    componentDidMount() {
        M.Sidenav.init(this.sidenav) /*M is the materialize object*/
    }

    render() {
        return(
            <ul ref={(element)=>{this.sidenav=element}} id='sidenav' className='sidenav'>
                {this.props.links}
            </ul>
        )
    }
}

export default SideNav;