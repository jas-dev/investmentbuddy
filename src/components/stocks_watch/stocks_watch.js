import React, {Component, Fragment} from 'react';
import Table from '../table/table'

class Watchlist extends Component{
    render(){
        return(
           <div>
                <h3>Watchlist</h3>
                <Table/>
           </div>
        )
    }
}

export default Watchlist;