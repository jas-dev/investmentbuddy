import React, {Component} from 'react';

class Search extends Component {
    constructor(props){
        super(props);
        this.state = {
            symbol: ""
        };
        this.userTyped = this.userTyped.bind(this);
        this.handleForm = this.handleForm.bind(this);
    }

    userTyped(event){
        this.setState({
            symbol: event.target.value
        });
    }

    handleForm(event){
        event.preventDefault();
        this.props.checkSearch(this.state.symbol);
    }

    render() {
        return (
            <div className='search-wrapper col s4 card card-padout'>
                <form action="" onSubmit={this.handleForm}>

                    <div className="row">
                    <div className="col s12 center">
                        <input type="text" placeholder="Search by company or symbol" onChange={this.userTyped}/>
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

