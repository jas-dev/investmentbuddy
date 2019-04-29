import React, {Component} from 'react';

class Faq extends Component {

    componentDidMount() {
        const elems = document.querySelectorAll('.collapsible');
        M.Collapsible.init(elems);
    }

    render() {
        return (
            <div className="container">
                <h1 className='center'>FAQ</h1>
                <div className="card">
                    <ul className="collapsible">
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How do I use
                                your app?
                            </div>
                            <div className="collapsible-body">

                                <div>
                                    Our app is designed for the those who are new to investing and want to get comfortable with the basics of investing in the stock market. You can easily view and access all features of the app from the user dashboard. If you would prefer to see a single page view of any part of the app, you can use the navigation bar to get there.
                                </div>
                                <br/>
                                <ul>
                                    <li><i className='material-icons'>chevron_right</i>View stock, company, and historical data accompanied by charts</li>
                                    <li><i className='material-icons'>chevron_right</i>Add funds to your account and start trading</li>
                                    <li><i className='material-icons'>chevron_right</i>Track your performance as you sharpen your financial wisdom</li>
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
                            <div className="collapsible-header"><i className="material-icons">help</i>How was The Cash Game made?
                            </div>
                            <div className="collapsible-body"><span>Please see the About section for complete list of tools, technologies, and developers involved.</span></div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How accurate is
                                your stock
                                data?
                            </div>
                            <div className="collapsible-body"><span>Our app uses the AlphaVantage stock market API, and delivers accurate, real-world stock data up to the previous trading day.</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        );
    }
}

export default Faq;