import React, {Component} from 'react';
import RenderTable from "../../render_table/render_table";
import axios from "axios";
import Search from '../../search';
import Loader from '../../loader';


class AllStocks extends Component{
    constructor(props) {
        super(props);

        this.state = {
            stocks: []
        };
        this.goToDetails = this.goToDetails.bind(this);
        this.checkSearch = this.checkSearch.bind(this);
    }

    componentDidMount() {
        this.getStockData();

    }

    getStockData(){
        axios.get('/api/getstocks.php').then(response=> {

            this.setState({
                stocks: response.data.stocks
            });
        });


    }

    goToDetails(symbol){
        this.props.history.push(`/stockdetails/${symbol}`);
    }

    addToWatchList(symbol){
        axios.get(`/api/addwatchlist.php?account_id=2&symbol=${symbol}`);
    }

    checkSearch(symbol){
        axios.get(`/api/getsymbollist.php`).then(response=>{
            for (let index=0; index<response.data.length; index++){
                if (symbol.toUpperCase()===response.data[index]){
                    this.goToDetails(symbol.toUpperCase());
                    return;
                }
            }
            M.toast({html: "No companies found!"});

        });
    }

    render(){

        if(!this.state.stocks.length){
            return <Loader/>;
        }

        return(
            <div className='container'>
                <div className="browse-stocks row">
                    <div className="col s6">
                        <h5>Browse Stocks</h5>
                    </div>
                    <div className="search-wrapper col s6 m4 right">
                        <Search checkSearch={this.checkSearch}/>
                    </div>
                </div>

                <RenderTable
                    stocks={this.state.stocks}
                    goToDetails={this.goToDetails}
                    addWatch={this.addToWatchList}
                    allStocks={true}
                    className=""
                />
                <div className="col s12 center hide-on-med-and-up">
                    <span className="">Swipe left on stock to browse table</span>
                </div>
            </div>
        )
    }
}

export default AllStocks;