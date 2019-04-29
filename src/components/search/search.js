import React, {Component} from 'react';

class Search extends Component {
    render() {
        return (
            <div className='search-wrapper col s3 card card-padout'>
                <form action="">
                    <input type="text" placeholder="Search by company or symbol"/>
                    <label htmlFor=""></label>
                    <button className="search btn green darken-2">Find</button>
                </form>
            </div>
        )
    }
}

export default Search;