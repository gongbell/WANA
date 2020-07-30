import React, { Component } from 'react';
import { Col, Row, Progress, Divider, Button } from 'antd';

class ApplicationsDisplay extends Component {

    render() {
        return (
            <div>
                {
                    this.props.applications.map((value, index) =>
                        (<div>
                            <Row gutter={16}>
                                <Col span={10}>
                                    <p><strong>{value.departmentName} Department</strong></p>
                                </Col>
                                <Col span={14} style={{ textAlign: "right" }}>
                                    <Button onClick={() => { this.props.onApprove(value.id) }} type="primary">Approve</Button> <Button onClick={() => { this.props.onReject(value.id) }} type="dashed">Reject</Button>
                                </Col>
                            </Row>
                            <Row gutter={16} style={{ paddingTop: 8 }}>
                                <Col span={10}>
                                    <p>Allowance Change:</p>
                                </Col>
                                <Col span={14}>
                                    <p style={{ textAlign: "right" }}>From <strong>{value.from}</strong> to <strong>{value.to}</strong></p>
                                </Col>
                            </Row>
                            {index == this.props.applications.length - 1 ?
                                null
                                : <Divider />}
                        </div>)
                    )
                }
            </div>
        );
    }
}

export default ApplicationsDisplay;
