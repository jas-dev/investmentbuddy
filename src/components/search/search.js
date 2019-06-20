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
            <form className="search" onSubmit={this.handleForm}>
                <div className="input-field">
                    <i className="material-icons prefix">
                        search
                    </i>
                    <input id="search" type="search" placeholder="Symbol" className="truncate" onChange={this.userTyped}/>
                    <label htmlFor="Search"/>
                </div>
            </form>
        )
    }
}

export default Search;

