import React, { Component } from 'react';
import { Col, Row, Progress, Divider, Button } from 'antd';

class DepartmentsDisplay extends Component {

    render() {
        return (
            <div>
                {
                    this.props.departments.map((value, index) =>
                        (<div>
                            <Row gutter={16}>
                                <Col span={10}>
                                    <p><strong>{value.name}</strong></p>
                                </Col>
                                <Col span={14} style={{ textAlign: "right" }}>
                                    {
                                        value.enabled ? <Button type="dashed" onClick={() => { this.props.onSuspend(value.id) }}>Suspend</Button>
                                            : <Button type="primary" onClick={() => { this.props.onResume(value.id) }}>Resume</Button>
                                    }
                                    {/* <Button type="danger" onClick={() => { this.props.onRemoval(value.id) }}>Remove</Button> */}
                                </Col>
                            </Row>
                            <Row gutter={16} style={{ paddingTop: 10, marginBottom: 0 }}>
                                <Col span={16}>
                                    <Progress percent={value.percent} showInfo={false} />
                                </Col>
                                <Col span={8} style={{ textAlign: "right" }}>
                                    <p>{value.used} / {value.total}</p>
                                </Col>
                            </Row>
                            {index == this.props.departments.length - 1 ?
                                null
                                : <Divider />}
                        </div>)
                    )
                }
            </div>
        );
    }
}

export default DepartmentsDisplay;
