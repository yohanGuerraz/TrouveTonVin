import {BrowserRouter as Router, Switch, Route} from "react-router-dom";
import React from 'react';
import '../../App.css';
import Style from "../profile/Style";

function ProfilePage() {
  return (
    <div className="ProfilePage">
      <Router>
        <Switch>
            <Route exact path= "/Profile">
                <Style/>
            </Route>
        </Switch>
      </Router>
    </div>
  );
}

export default ProfilePage;