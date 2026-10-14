import React from "react";
import "font-awesome/css/font-awesome.min.css";
import "./App.css";
import Pictogramme from "./Composants/Pictogramme";
import Commentaire from "./Composants/Commentaire";

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { message: 'Bonne découverte des composants React "Components!!!"' };
  }

  aimer = () => {
    this.setState({ message: "Premier défi réussi" });
  };

  render() {
    return (
      <div className="col-6 offset-3">
        <div className="card">
          <div className="card-block">
            <div className="row">
              <div className="col-2">
                <img
                  src="https://thomas-bart.com/wp-content/uploads/2017/03/developper-1680x1201.jpg"
                  className="rounded float-left img-thumbnail"
                  width="80"
                  height="70"
                  alt="developper"
                />
              </div>
              <div className="col-10 profile-row">
                <div className="row">
                  <a href="#"><h1> Débuter avec React </h1></a>
                </div>
              </div>
            </div>

            <p>{this.state.message}</p>

            <div>
              <Pictogramme onLike={this.aimer} />
            </div>
          </div>

          <div className="card-footer text-muted">
            <Commentaire />
          </div>
        </div>
      </div>
    );
  }
}

export default App;