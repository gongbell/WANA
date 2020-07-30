import React, { Component } from 'react';
import { Card, Divider, Row, Col, Button, Modal, Input } from 'antd';
import Eos from "eosjs";

let eos;

class ExpenditureDetailPage extends Component {

    constructor(props) {
        super(props);

        this.state = {
            departmentId: Number.parseInt(sessionStorage.getItem("departmentId")),
            expenditureId: this.props.match.params.id,
            expenditureName: "-",
            expenditureRecipient: "-",
            expenditureAllowance: "-",
            expenditureUsed: "-",
            expenditureAllowanceLeft: "-",
            tokenName: "XXX",
            expenses: null,
            spendVisible: false,
            spendAmount: "",
            limitVisible: false,
            newLimit: "",
            deleteVisible: false,
            memo: "",
            accountName: sessionStorage.getItem("acctName"),
            errorVisible: false,
            errorMsg: ""
        };

        const keys = JSON.parse(sessionStorage.getItem("privateKey"));
        const provider = new Array();
        for (let i = 0; i < keys.length; i++)
            provider.push(keys[i]);

        eos = Eos({
            httpEndpoint: "http://127.0.0.1:8888",
            chainId: "cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f",
            keyProvider: provider
        });

        this.initPage();
    }

    initPage = async () => {

        const configs = (await eos.getTableRows(true, "wallet", "wallet", "configs")).rows[0];
        let expenditure;
        const expenditures = (await eos.getTableRows(true, "wallet", this.state.departmentId, "expenditures")).rows;
        for (let i = 0; i < expenditures.length; i++) {
            const currentExpenditure = expenditures[i];
            if (currentExpenditure.id == this.state.expenditureId) {
                expenditure = currentExpenditure;
            }
        }

        const token = this.parseToken(configs.token);

        const expenses = (await eos.getTableRows(true, "wallet", "wallet", "expenses")).rows;
        const displayedExpenses = new Array();
        for (let i = expenses.length - 1; i >= 0; i--) {

            const currentExpense = expenses[i];
            if (currentExpense.department_id != this.state.departmentId || currentExpense.expenditure_id != this.state.expenditureId)
                continue;

            displayedExpenses.push({
                time: currentExpense.time,
                amount: this.scaleAmount(currentExpense.amount, token.precision),
                memo: currentExpense.memo
            });
        }

        this.setState({
            expenditureName: expenditure.name,
            expenditureRecipient: expenditure.recipient,
            expenditureAllowance: this.scaleAmount(expenditure.monthly_allowance, token.precision),
            expenditureUsed: this.scaleAmount(this.actualUsed(expenditure.allowance_used, expenditure.last_spend_time), token.precision),
            expenditureAllowanceLeft: this.scaleAmount(expenditure.monthly_allowance - this.actualUsed(expenditure.allowance_used, expenditure.last_spend_time), token.precision),
            tokenName: token.name,
            tokenPrecision: token.precision,
            expenses: displayedExpenses
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

    handleSpend = async () => {
        if (this.state.spendAmount.length == 0 || isNaN(this.state.spendAmount))
            return;

        const spendAmount = Math.round(Number.parseFloat(this.state.spendAmount) * Math.pow(10, this.state.tokenPrecision));

        try {
            await eos.transaction("wallet", wallet => {
                wallet.spend(this.state.departmentId, this.state.expenditureId, spendAmount, this.state.memo, { authorization: this.state.accountName + "@active" })
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.setState({ spendVisible: false });

        this.initPage();
    }

    handleLimit = async () => {
        if (this.state.newLimit.length == 0 || isNaN(this.state.newLimit))
            return;

        const newLimit = Math.round(Number.parseFloat(this.state.newLimit) * Math.pow(10, this.state.tokenPrecision));

        try {
            await eos.transaction("wallet", wallet => {
                wallet.adjexpense(this.state.departmentId, this.state.expenditureId, newLimit, { authorization: this.state.accountName + "@active" })
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.setState({ limitVisible: false });

        this.initPage();
    }

    handleDelete = async () => {

        try {
            await eos.transaction("wallet", wallet => {
                wallet.rmexpense(this.state.departmentId, this.state.expenditureId, { authorization: this.state.accountName + "@active" })
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.setState({ deleteVisible: false });

        this.initPage();
    }

    unixToString = (unix) => {
        let ret = new Date(unix * 1000).toISOString().replace("T", " ");
        ret = ret.substr(0, ret.indexOf("."));
        return ret;
    }

    render() {
        return (
            <div>
                <h1>{this.state.expenditureName} Expenditure</h1>
                <Card title="Overview" extra={<div><Button type="primary" onClick={() => { this.setState({ spendVisible: true }); }}>Spend</Button>  <Button type="default" onClick={() => { this.setState({ limitVisible: true }); }}>Change Limit</Button>  <Button type="danger" onClick={() => { this.setState({ deleteVisible: true }); }}>Delete</Button></div>}>
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Recipient:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.expenditureRecipient}</strong></p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Allowance:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.expenditureAllowance} {this.state.tokenName}</strong></p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Used:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.expenditureUsed} {this.state.tokenName}</strong></p>
                        </Col>
                    </Row>
                </Card>
                <br />

                <Card title="Expense History">
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
                <Modal
                    title="Spend Tokens"
                    visible={this.state.spendVisible}
                    okText="Submit"
                    onOk={this.handleSpend}
                    onCancel={() => { this.setState({ spendVisible: false }) }}
                >
                    <Row gutter={16}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p>Monthly Allowance:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <p>{this.state.expenditureAllowance}</p>
                        </Col>
                        <Col span={4}>
                            <p>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p>Allowance Left:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <p>{this.state.expenditureAllowanceLeft}</p>
                        </Col>
                        <Col span={4}>
                            <p>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                    <Row gutter={16} style={{ display: "flex", alignItems: "center" }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Amount:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ spendAmount: e.target.value }) }} />
                        </Col>
                        <Col span={4}>
                            <p style={{ margin: 0 }}>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                    <Row gutter={16} style={{ display: "flex", alignItems: "center", marginTop: 8 }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Memo:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ memo: e.target.value }) }} />
                        </Col>
                    </Row>
                </Modal>
                <Modal
                    title="Change Expenditure Limit"
                    visible={this.state.limitVisible}
                    okText="Submit"
                    onOk={this.handleLimit}
                    onCancel={() => { this.setState({ limitVisible: false }) }}
                >
                    <Row gutter={16}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p>Monthly Allowance:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <p>{this.state.expenditureAllowance}</p>
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
                            <Input placeholder="" onChange={(e) => { this.setState({ newLimit: e.target.value }) }} />
                        </Col>
                        <Col span={4}>
                            <p style={{ margin: 0 }}>{this.state.tokenName}</p>
                        </Col>
                    </Row>
                </Modal>
                <Modal
                    title="Confirm Expenditure Deletion"
                    visible={this.state.deleteVisible}
                    okText="Delete"
                    onOk={this.handleDelete}
                    onCancel={() => { this.setState({ deleteVisible: false }) }}
                >
                    <p>Are you sure you want to delete the expenditure?</p>
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

        )
    }
}

export default ExpenditureDetailPage;
