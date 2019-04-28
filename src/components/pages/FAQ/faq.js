import React, {Component, Fragment} from 'react';

class Faq extends Component {

    componentDidMount() {
        const elems = document.querySelectorAll('.collapsible');
        const instances = M.Collapsible.init(elems);
    }

    render() {
        return (
            <Fragment>
                <h4 className='center'>FAQ</h4>
                <div className='divider'/>
                <div className="container center">
                    <ul className="collapsible">
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How do I use
                                your app?
                            </div>
                            <div className="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>What kind of
                                investments can
                                I make?
                            </div>
                            <div className="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>Does it cost
                                anything?
                            </div>
                            <div className="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
                        </li>
                        <li>
                            <div className="collapsible-header"><i className="material-icons">help</i>How accurate is
                                your stock
                                data?
                            </div>
                            <div className="collapsible-body"><span>Lorem ipsum dolor sit amet.</span></div>
                        </li>
                    </ul>
                </div>


            </Fragment>
        );
    }
}

export default Faq;