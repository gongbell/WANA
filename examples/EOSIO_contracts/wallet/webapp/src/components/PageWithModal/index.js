import React, {Component} from 'react';
import {Card, Col, Row, Divider, Modal, Input} from 'antd';

import ExpenditureDisplay from "../../components/ExpenditureDisplay";

class PageWithModal extends Component {
    constructor(props) {
        super(props);
        this.state = ( {
            changeAllowanceModal: false,
            title: "Page",
            modalTitle: "Modal Title"
        });
    }

    showModal = () => {
        this.setState({
            newDepartmentModalVisibility: true,
        });
    }

    handleOk = (e) => {
        console.log(e);
        this.setState({
            newDepartmentModalVisibility: false,
        });
    }

    handleCancel = (e) => {
        console.log(e);
        this.setState({
            newDepartmentModalVisibility: false,
        });
    }

    getModal() {
        return (<Modal
            title={this.state.modalTitle}
            visible={this.state.changeAllowanceModal}
            okText="Submit"
            onOk={this.handleOk}
            onCancel={this.handleCancel}
        >
        </Modal>)
    }

    getPageContainer() {
        return (<a href="#" onClick={this.showModal}>showModal</a>)
    }

    render() {
        return (
            <div>
                <h1>{this.state.title}</h1>
                {this.getModal()}
                {this.getPageContainer()}
            </div>
        );
    }
}

export default PageWithModal;
