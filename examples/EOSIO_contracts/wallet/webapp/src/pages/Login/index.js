import React, { Component } from 'react';
import { withRouter } from "react-router-dom";
import { Button } from 'antd';
import "./index.css";

class Login extends Component {

    handleHrLogin = () => {
        sessionStorage.setItem("acctName", "hrmgr");
        sessionStorage.setItem("departmentId", "2");
        sessionStorage.setItem("privateKey", "[\"5JaekDL3XeCt3MjXvpUiRr1mowRVjCitXi4WKRKK5uDDPM4GN1d\"]");
        this.props.history.push("/manager");
    }

    handleMktLogin = () => {
        sessionStorage.setItem("acctName", "mktmgr");
        sessionStorage.setItem("departmentId", "1");
        sessionStorage.setItem("privateKey", "[\"5JzTMCC7u5eFvy1rBjQBkKjpkRNF5V9d3aTuUk6pXkB6bEGYvv5\"]");
        this.props.history.push("/manager");
    }

    handleCfoLogin = () => {
        sessionStorage.setItem("acctName", "cfo");
        sessionStorage.setItem("privateKey", "[\"5Hy6fgqpDaczdH82wMK3BTKf7aktg3vj9qFdem35FL1bBykYro4\"]");
        this.props.history.push("/cfo");
    }

    render() {
        return (
            <div className="loginPage">
                <div className="formHolder">
                    <div className="contentHolder">
                        <h2><strong>Login to EOSafe</strong></h2>
                        <p>Keys are hard-coded into the application for demostration purpose only. Wallet management software like Scatter should be used instead for production.</p>
                        <Button className="btn" type="primary" block onClick={this.handleHrLogin}>Login as HR Manager</Button>
                        <Button className="btn" type="primary" block onClick={this.handleMktLogin}>Login as Marketing Manager</Button>
                        <Button className="btn" type="primary" block onClick={this.handleCfoLogin}>Login as CFO</Button>
                    </div>
                </div>
            </div>
        );
    }
}

export default withRouter(Login);