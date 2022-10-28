import React, { Component } from 'react';
import Toolbar from '../Toolbar/Toolbar';
import SideDrawer from '../SideDrawer/SideDrawer';
import Backdrop from '../Backdrop/Backdrop';

class HomePage extends Component {
    state = {
        sideDrawerOpen: false
    };
    
    drawerToggleClickHandler = () => {
        this.setState((prevState) => {
        return {sideDrawerOpen: !prevState.sideDrawerOpen};
        });
    };
    
    backdropClickHandler = () => {
        this.setState({sideDrawerOpen: false});
    };
      
    render = () => {
        let backdrop;
      
        if (this.state.sideDrawerOpen) {
            backdrop = <Backdrop click={this.backdropClickHandler} />
        }
        return (
            <Layout page_title = {page_tit}>
                <div style={{height: '100%'}}>
                    <Toolbar drawerClickHandler={this.drawerToggleClickHandler} />
                    <SideDrawer show={this.state.sideDrawerOpen} />
                    {backdrop}
                    <main style={{marginTop: '64px'}}>
                        <p>This is the page content!</p>
                    </main>
    
                </div>
            </Layout>
        );
    }

}
export default HomePage;