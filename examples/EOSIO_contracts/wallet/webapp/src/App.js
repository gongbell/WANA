import React, {Component} from 'react';
import {
    BrowserRouter as Router,
    Route,
    Switch,
    withRouter
} from 'react-router-dom'
import {Layout, Menu} from 'antd';
import './App.css';

import login from "./pages/Login";
import dashboard from "./pages/Dashboard";
import cfoDashboard from "./pages/CFODashBoard";
import expenditureDetailPage from "./pages/ExpenditureDetailPage"

const {Header, Content, Footer} = Layout;

class App extends Component {

    state = {
        current: 'Dashborad',
    }

    handleClick = (e) => {
        console.log('click ', e);
        this.setState({
            current: e.key,
        });
    }

    render() {
        return (
            <Switch>
                <Route exact path="/" component={login}/>
                <Route exact>
                    <Layout className="layout">
                        <Header>
                            <div className="logo"/>
                            <Menu
                                theme="dark"
                                mode="horizontal"
                                defaultSelectedKeys={['1']}
                                style={{lineHeight: '64px'}}>
                                <Menu.Item key="1" onClick={() => {
                                    this.props.history.push("/manager")
                                }}>Dashboard</Menu.Item>
                            </Menu>
                        </Header>
                        <Content style={{padding: '0 50px'}}>
                            <div style={{background: '#fff', marginTop: 24, padding: 24, minHeight: 280}}>
                                <Switch>
                                    <Route exact path="/manager" component={dashboard}/>
                                    <Route exact path="/cfo" component={cfoDashboard}/>
                                    <Route exact path="/manager/expenditure/:id" component={expenditureDetailPage}/>
                                </Switch>
                            </div>
                        </Content>
                        <Footer style={{textAlign: 'center'}}>
                            Created by EOSafe
                        </Footer>
                    </Layout>
                </Route>
            </Switch>
        );
    }
}


export default withRouter(App);
