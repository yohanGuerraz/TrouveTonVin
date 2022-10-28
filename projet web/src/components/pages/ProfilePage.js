import {BrowserRouter as Router, Switch, Route} from "react-router-dom";
import React from 'react';
import '../../css/App.css';
import Style from "../profile/Style";

function ProfilePage() {
  return (
    <Layout page_title = {page_tit}>
      <div className="ProfilePage">
        <Router>
          <Switch>
              <Route exact path= "/Profile">
                  <Style/>
              </Route>
          </Switch>
        </Router>
      </div>
    </Layout>
  );
}

export default ProfilePage;