import React, {Component} from 'react';

class Search extends Component {
    render() {
        return (
            <div className='search-wrapper col s4 card card-padout'>
                <form action="">

                    <div className="row">
                    <div className="col s12 center">
                        <input type="text" placeholder="Search by company or symbol"/>
                        <label htmlFor=""></label>
                    </div>
                    </div>
                    <div className="row">
                    <div className="col s12 center">
                        <button className="search btn btn-small">Find</button>
                    </div>
                    </div>

                </form>
            </div>
        )
    }
}

export default Search;

