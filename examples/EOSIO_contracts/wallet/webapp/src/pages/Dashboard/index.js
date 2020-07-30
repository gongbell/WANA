import React, { Component } from 'react';
import { withRouter } from "react-router-dom";
import { Card, Col, Row, Divider, Modal, Input } from 'antd';
import Eos from "eosjs";
import ecc from "eosjs-ecc";

import ExpenditureDisplay from "../../components/ExpenditureDisplay";

let eos;

class Dashborad extends Component {

    constructor(props) {
        super(props);

        this.state = {
            departmentId: Number.parseInt(sessionStorage.getItem("departmentId")),
            changeAllowanceModal: false,
            newExpenseVisible: false,
            newName: "",
            recipient: "",
            expenseAllownance: "",
            departmentName: "-",
            monthlyAllowance: "-",
            allowanceUsed: "-",
            allowanceAllocated: "-",
            expenditures: null,
            expenses: null,
            tokenName: "XXX",
            tokenPrecision: 0,
            tokenContract: "",
            newAllowance: "",
            deptPerm: "",
            accountName: sessionStorage.getItem("acctName"),
            errorVisible: false,
            errorMsg: ""
        };

        if (!sessionStorage.getItem("privateKey")) {
            this.props.history.push("/");
            return;
        }

        const keys = JSON.parse(sessionStorage.getItem("privateKey"));
        const provider = new Array();
        for (let i = 0; i < keys.length; i++)
            provider.push(keys[i]);

        eos = Eos({
            keyProvider: provider,
            httpEndpoint: "http://127.0.0.1:8888",
            chainId: "cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f",
        });

        this.pageInit();
    }

    pageInit = async () => {

        const configs = (await eos.getTableRows(true, "wallet", "wallet", "configs")).rows[0];
        const departments = (await eos.getTableRows(true, "wallet", "wallet", "departments")).rows;
        let department;
        for (let i = 0; i < departments.length; i++) {
            if (departments[i].id == this.state.departmentId) {
                department = departments[i];
                break;
            }
        }
        const expenditures = (await eos.getTableRows(true, "wallet", department.id, "expenditures")).rows;
        const expenses = (await eos.getTableRows(true, "wallet", "wallet", "expenses")).rows;

        const token = this.parseToken(configs.token);

        const displayedExpenditures = new Array();
        const displayedExpenses = new Array();

        for (let i = 0; i < expenditures.length; i++) {

            const currentExpenditure = expenditures[i];
            if (currentExpenditure.removed)
                continue;

            displayedExpenditures.push({
                id: currentExpenditure.id,
                name: currentExpenditure.name,
                used: this.formatAmount(this.actualUsed(currentExpenditure.allowance_used, currentExpenditure.last_spend_time), token),
                total: this.formatAmount(currentExpenditure.monthly_allowance, token),
                percent: Math.round(this.actualUsed(currentExpenditure.allowance_used, currentExpenditure.last_spend_time) / currentExpenditure.monthly_allowance * 100)
            });
        }

        for (let i = expenses.length - 1; i >= 0; i--) {

            const currentExpense = expenses[i];
            if (currentExpense.department_id != department.id)
                continue;

            displayedExpenses.push({
                time: currentExpense.time,
                amount: this.scaleAmount(currentExpense.amount, token.precision),
                memo: currentExpense.memo
            });
        }

        this.setState({
            departmentName: department.name,
            monthlyAllowance: this.scaleAmount(department.monthly_allowance, token.precision),
            allowanceUsed: this.scaleAmount(this.actualUsed(department.allowance_used, department.last_spend_time), token.precision),
            allowanceAllocated: this.scaleAmount(department.allowance_allocated, token.precision),
            expenditures: displayedExpenditures,
            expenses: displayedExpenses,
            tokenName: token.name,
            tokenPrecision: token.precision,
            tokenContract: configs.token.contract,
            deptPerm: department.permission
        });
    }

    actualUsed = (used, usedTime) => {
        let spendDate = new Date(usedTime * 1000);
        let nowDate = new Date();

        if (spendDate.getUTCFullYear() == nowDate.getFullYear() && spendDate.getUTCMonth() == nowDate.getUTCMonth())
            return used;

        return 0;
    }

    formatAmount = (amount, token) => {
        return this.scaleAmount(amount, token.precision) + " " + token.name;
    }

    scaleAmount = (amount, precision) => {
        return (amount / Math.pow(10, precision)).toFixed(precision);
    }

    parseToken = (token) => {

        let symbolName = "";

        let tokenValue = token.value;
        let tokenPrecision = tokenValue & 0xFF;
        tokenValue >>= 8;
        while (tokenValue > 0) {
            symbolName += String.fromCharCode(tokenValue & 0xFF);
            tokenValue >>= 8;
        }

        return { name: symbolName, precision: tokenPrecision };
    }

    showModal = () => {
        this.setState({
            changeAllowanceModal: true,
        });
    }

    handleOk = async (e) => {

        if (this.state.newAllowance.length == 0 || isNaN(this.state.newAllowance))
            return;

        const newAmount = Math.round(Number.parseFloat(this.state.newAllowance) * Math.pow(10, this.state.tokenPrecision));

        try {
            await eos.transaction("wallet", wallet => {
                wallet.setdeptlmt(this.state.departmentId, newAmount, { authorization: this.state.accountName + "@active" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.setState({
            changeAllowanceModal: false,
        });

        this.pageInit();
    }

    handleNewExpense = async () => {

        if (this.state.expenseAllownance.length == 0 || isNaN(this.state.expenseAllownance))
            return;

        const expenseAllownance = Math.round(Number.parseFloat(this.state.expenseAllownance) * Math.pow(10, this.state.tokenPrecision));

        try {
            await eos.transaction("wallet", wallet => {
                wallet.addexpense(this.state.departmentId, this.state.newName, this.state.recipient, expenseAllownance, { authorization: this.state.accountName + "@active" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.setState({
            newExpenseVisible: false,
        });

        this.pageInit();
    }

    unixToString = (unix) => {
        let ret = new Date(unix * 1000).toISOString().replace("T", " ");
        ret = ret.substr(0, ret.indexOf("."));
        return ret;
    }

    render() {
        return (
            <div>
                <h1>{this.state.departmentName} Department</h1>
                <Card
                    style={{ width: '100%' }}
                    title="Allowance"
                    extra={<a href="#" onClick={this.showModal}>Apply to Change</a>}
                >
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Monthly Allowance:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.monthlyAllowance} {this.state.tokenName}</strong></p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Allowance Used:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.allowanceUsed} {this.state.tokenName}</strong></p>
                        </Col>
                    </Row>
                </Card>
                <br />
                <Row gutter={16}>
                    <Col span={12}>
                        <Card
                            style={{ width: '100%' }}
                            title="Expenditures"
                            extra={<a onClick={() => { this.setState({ newExpenseVisible: true }); }}>Create New</a>}
                            activeTabKey={this.state.key}
                            onTabChange={(key) => { this.onTabChange(key, 'key'); }}
                        >
                            {
                                this.state.expenditures ? <ExpenditureDisplay expenditures={this.state.expenditures} /> : null
                            }
                        </Card>
                    </Col>
                    <Col span={12}>
                        <Card
                            style={{ width: '100%' }}
                            title="Recent Expenses"
                            // extra={<a href="#">See All</a>}
                            activeTabKey={this.state.key}
                            onTabChange={(key) => { this.onTabChange(key, 'key'); }}
                        >
                            {
                                this.state.expenses == null ? null :
                                    this.state.expenses.map((value, index) => <div>
                                        <Row gutter={16}>
                                            <Col span={8}>
                                                <p style={{ margin: 0, color: "grey" }}>{this.unixToString(value.time)}</p>
                                            </Col>
                                            <Col span={8}>
                                                <p style={{ margin: 0 }}>{value.memo}</p>
                                            </Col>
                                            <Col span={8}>
                                                <p style={{ margin: 0, fontWeight: "bold", textAlign: "right" }}>- {value.amount} {this.state.tokenName}</p>
                                            </Col>
                                        </Row>
                                        {index == this.state.expenses.length - 1 ? null : <Divider />}
                                    </div>)
                            }
                        </Card>
                    </Col>
                </Row>

                <Modal
                    title="Change Department Allowance"
                    visible={this.state.changeAllowanceModal}
                    okText="Submit"
                    onOk={this.handleOk}
                    onCancel={() => { this.setState({ changeAllowanceModal: false }); }}
                >
                    <Row gutter={16}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p>Current Allowance:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <p>{this.state.monthlyAllowance}</p>
                        </Col>
                        <Col span={4}>
                            <p>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p>Allocated Allowance:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <p>{this.state.allowanceAllocated}</p>
                        </Col>
                        <Col span={4}>
                            <p>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p>Allowance Used:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <p>{this.state.allowanceUsed}</p>
                        </Col>
                        <Col span={4}>
                            <p>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                    <Row gutter={16} style={{ display: "flex", alignItems: "center" }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>New Allowance:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ newAllowance: e.target.value }) }} />
                        </Col>
                        <Col span={4}>
                            <p style={{ margin: 0 }}>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                </Modal>
                <Modal
                    title="New Expenditure Item"
                    visible={this.state.newExpenseVisible}
                    okText="Submit"
                    onOk={this.handleNewExpense}
                    onCancel={() => { this.setState({ newExpenseVisible: false }); }}
                >
                    <Row gutter={16} style={{ display: "flex", alignItems: "center" }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Name:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ newName: e.target.value }) }} />
                        </Col>
                    </Row>
                    <Row gutter={16} style={{ display: "flex", alignItems: "center", marginTop: 8 }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Recipient:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ recipient: e.target.value }) }} />
                        </Col>
                    </Row>
                    <Row gutter={16} style={{ display: "flex", alignItems: "center", marginTop: 8 }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Monthly Allowance:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ expenseAllownance: e.target.value }) }} />
                        </Col>
                        <Col span={4}>
                            <p style={{ margin: 0 }}>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                </Modal>
                <Modal
                    title="Operation Failed"
                    visible={this.state.errorVisible}
                    okText="OK"
                    onOk={() => { this.setState({ errorVisible: false }) }}
                    onCancel={() => { this.setState({ errorVisible: false }) }}
                >
                    <p>{this.state.errorMsg}</p>
                </Modal>
            </div>
        );
    }
}

export default withRouter(Dashborad);
