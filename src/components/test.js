import React, { Component } from 'react';
import axios from 'axios';

class Test extends Component {
    componentDidMount() {
        this.testApi();
    }

    async testApi(){
        const resp = await axios.get('/api/test.php');


    }

    render(){
        return (
            <div>
                <h1>This is a Test</h1>
            </div>
        );
    }
}

export default Test;
