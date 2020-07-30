import React, { Component } from 'react';
import { withRouter } from "react-router-dom";
import { Card, Col, Row, Divider, Modal, Input } from 'antd';
import Eos from "eosjs";

import DepartmentsDisplay from "../../components/DepartmentsDisplay";
import ApplicationsDisplay from "../../components/ApplicationsDisplay";

let eos;

class CFODashboard extends Component {

    constructor(props) {
        super(props);

        this.state = {
            newDepartmentModalVisibility: false,
            deptName: "",
            deptMgr: "",
            walletBalance: "- XXX",
            sysLmt: "-",
            sysUsed: "-",
            tokenName: "XXX",
            tokenPrecision: 0,
            tokenContract: "",
            newAllowance: "",
            departments: [],
            applications: [],
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
            httpEndpoint: "http://127.0.0.1:8888",
            chainId: "cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f",
            keyProvider: provider
        });

        this.pageInit();
    }

    pageInit = async () => {

        const configs = (await eos.getTableRows(true, "wallet", "wallet", "configs")).rows[0];
        const token = this.parseToken(configs.token);
        const balance = await eos.getCurrencyBalance(configs.token.contract, "wallet", token.name);
        const departmentNames = new Object();

        const displayedDepartments = new Array();
        const departments = (await eos.getTableRows(true, "wallet", "wallet", "departments")).rows;
        for (let i = 0; i < departments.length; i++) {
            const currentDepartment = departments[i];
            departmentNames[currentDepartment.id] = currentDepartment.name;
            displayedDepartments.push({
                key: currentDepartment.id,
                id: currentDepartment.id,
                name: currentDepartment.name,
                enabled: currentDepartment.enabled,
                total: this.scaleAmount(currentDepartment.monthly_allowance, token.precision),
                used: this.scaleAmount(currentDepartment.allowance_used, token.precision),
                percent: Math.round(currentDepartment.allowance_used / currentDepartment.monthly_allowance * 100)
            });
        }

        const applications = (await eos.getTableRows(true, "wallet", "wallet", "applications")).rows;
        const displayedApplications = new Array();
        for (let i = 0; i < applications.length; i++) {
            const currentApplication = applications[i];
            if (currentApplication.status != 1)
                continue;

            displayedApplications.push({
                id: currentApplication.application_id,
                departmentId: currentApplication.department_id,
                from: this.formatAmount(currentApplication.from_allowance, token),
                to: this.formatAmount(currentApplication.to_allowance, token),
                departmentName: departmentNames[currentApplication.department_id]
            })
        }

        this.setState({
            walletBalance: balance[0],
            departments: displayedDepartments,
            applications: displayedApplications,
            sysLmt: this.scaleAmount(configs.system_monthly_limit, token.precision),
            sysUsed: this.scaleAmount(this.actualUsed(configs.system_limit_used, configs.last_spend_time), token.precision),
            tokenName: token.name,
            tokenPrecision: token.precision,
            tokenContract: configs.token.contract
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

    handleApprove = async (id) => {
        try {
            await eos.transaction("wallet", wallet => {
                wallet.processapp(id, 1, { authorization: "executor@processapp" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.pageInit();
    }

    handleRejct = async (id) => {
        try {
            await eos.transaction("wallet", wallet => {
                wallet.processapp(id, 0, { authorization: "executor@processapp" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.pageInit();
    }

    handleSuspend = async (id) => {
        try {
            await eos.transaction("wallet", wallet => {
                wallet.toggledept(id, 0, { authorization: "executor@tgldept" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.pageInit();
    }

    handleResume = async (id) => {
        try {
            await eos.transaction("wallet", wallet => {
                wallet.toggledept(id, 1, { authorization: "executor@tgldept" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.pageInit();
    }

    handleRemoval = async (id) => {

    }

    showModal = () => {
        this.setState({
            newDepartmentModalVisibility: true,
        });
    }

    handleNewDept = async (e) => {

        try {
            await eos.transaction("wallet", wallet => {
                wallet.newdept(this.state.deptName, this.state.deptMgr, { authorization: "executor@newdept" });
            });
        }
        catch (ex) {
            this.setState({
                errorVisible: true,
                errorMsg: ex.toString()
            });
        }

        this.setState({
            newDepartmentModalVisibility: false,
        });

        this.pageInit();
    }

    render() {
        return (
            <div>
                <h1>{this.state.departmentName} CFO Dashboard</h1>
                <Card
                    style={{ width: '100%' }}
                    title="Overview">
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Wallet Balance:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.walletBalance}</strong></p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>System Level Monthly Limit:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.sysLmt} {this.state.tokenName}</strong></p>
                        </Col>
                    </Row>
                    <Row gutter={16}>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}>Expense This Month:</p>
                        </Col>
                        <Col span={12}>
                            <p style={{ textAlign: "center" }}><strong>{this.state.sysUsed} {this.state.tokenName}</strong></p>
                        </Col>
                    </Row>
                </Card>
                <br />
                <Row gutter={16}>
                    <Col span={12}>
                        <Card
                            style={{ width: '100%' }}
                            title="Departments"
                            extra={<a onClick={() => { this.setState({ newDepartmentModalVisibility: true }); }}>New Department</a>}
                            activeTabKey={this.state.key}
                            onTabChange={(key) => { this.onTabChange(key, 'key'); }}>
                            {
                                this.state.departments ? <DepartmentsDisplay onSuspend={this.handleSuspend} onResume={this.handleResume} departments={this.state.departments} /> : null
                            }
                        </Card>
                    </Col>
                    <Col span={12}>
                        <Card
                            style={{ width: '100%' }}
                            title="Applications"
                            activeTabKey={this.state.key}
                            onTabChange={(key) => { this.onTabChange(key, 'key'); }}
                        >
                            {
                                this.state.applications ? <ApplicationsDisplay onApprove={this.handleApprove} onReject={this.handleRejct} applications={this.state.applications} /> : null
                            }
                        </Card>
                    </Col>
                </Row>

                <Modal
                    title="New Department"
                    visible={this.state.newDepartmentModalVisibility}
                    okText="Submit"
                    onOk={this.handleNewDept}
                    onCancel={() => { this.setState({ newDepartmentModalVisibility: false }); }}
                >
                    <Row gutter={16} style={{ display: "flex", alignItems: "center" }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Name:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ deptName: e.target.value }) }} />
                        </Col>
                    </Row>
                    <Row gutter={16} style={{ display: "flex", alignItems: "center", paddingTop: 8 }}>
                        <Col span={10} style={{ textAlign: "center" }}>
                            <p style={{ margin: 0 }}>Manager:</p>
                        </Col>
                        <Col span={10} style={{ textAlign: "right" }}>
                            <Input placeholder="" onChange={(e) => { this.setState({ deptMgr: e.target.value }) }} />
                        </Col>
                    </Row>
                    <p style={{
                        marginTop: 14,
                        marginBottom: 0,
                        color: "grey",
                        fontStyle: "italic",
                        textAlign: "center"
                    }}>Newly created departments always have <strong>0</strong> initial allowance.</p>
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

export default withRouter(CFODashboard);
