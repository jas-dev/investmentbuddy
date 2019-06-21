import React, {Component} from 'react';

class Faq extends Component {

    componentDidMount() {
        const elems = document.querySelectorAll('.collapsible');
        const instances = M.Collapsible.init(elems);
    }

    render() {
        return (
            <div className="container">
                <h1 className='center'>FAQ</h1>
                <div className="card faq">
                    <ul className="collapsible">
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How do I use
                                your app?
                            </div>
                            <div className="collapsible-body">

                                <div>
                                    Our app is designed for the those who are new to investing and want to get comfortable with the basics of investing in the stock market. You can easily view and access all features of the app from the user dashboard.
                                </div>
                                <br/>
                                <ul>
                                    <li><i className='material-icons prefix tiny'>chevron_right</i>View stock, company, and historical data with charts to help you visualize</li><br/>
                                    <li><i className='material-icons prefix tiny'>chevron_right</i>Use the dashboard to keep your eye on the market and your portfolio</li><br/>
                                    <li><i className='material-icons prefix tiny'>chevron_right</i>See stock details by clicking on any listing in the ticker and tables, or use the search bar on the Browse Stocks page</li><br/>
                                    <li><i className='material-icons prefix tiny'>chevron_right</i>Add stocks to your watchlist with the plus button on the listing, or use the search bar below the watchlist</li><br/>
                                    <li><i className='material-icons prefix tiny'>chevron_right</i>Add funds to your account and start trading!</li>
                                </ul>

                            </div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>What kind of
                                investments can
                                I simulate?
                            </div>
                            <div className="collapsible-body">
                                <span>The app will allow you to buy and sell shares of stocks. Future versions will allow you to trade in more advanced stock market instruments, like options.</span>
                            </div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How was InvestmentBuddy made?
                            </div>
                            <div className="collapsible-body"><span>InvestmentBuddy was built with Javascript ES6, React, Materialize, Sass and Redux for the front-end, while the data is handled by a PHP back-end and MySQL database.</span></div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How accurate is
                                your stock
                                data?
                            </div>
                            <div className="collapsible-body"><span>Our app uses the AlphaVantage stock market API, and delivers real data accurate up to the current trading day.</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        );
    }
}

export default Faq;