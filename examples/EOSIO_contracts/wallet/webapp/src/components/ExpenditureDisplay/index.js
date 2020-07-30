import React, { Component } from 'react';
import { withRouter } from "react-router-dom";
import { Col, Row, Progress, Divider } from 'antd';

class ExpenditureDisplay extends Component {

    render() {
        return (
            <div>
                {
                    this.props.expenditures.map((value, index) =>
                        (<div>
                            <Row gutter={16}>
                                <Col span={8}>
                                    <p><strong>{value.name}</strong></p>
                                </Col>
                                <Col span={4}>
                                    <a onClick={() => {
                                        this.props.history.push("/manager/expenditure/" + value.id);
                                    }}>Details</a>
                                </Col>
                                <Col span={12} style={{ textAlign: "right" }}>
                                    <p>{value.used} / {value.total}</p>
                                </Col>
                            </Row>
                            <Row gutter={16}>
                                <Col span={24}>
                                    <Progress percent={value.percent} />
                                </Col>
                            </Row>
                            {index == this.props.expenditures.length - 1 ?
                                null
                                : <Divider />}
                        </div>)
                    )
                }
            </div>
        );
    }
}

export default withRouter(ExpenditureDisplay);