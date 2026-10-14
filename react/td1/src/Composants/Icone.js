import React from "react";

class Icone extends React.Component {
  render() {
    return (
      <div>
        <span className="fa-stack fa-sm">
          <i className="fa fa-circle fa-stack-2x blue-icon"></i>
          <i className="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
        </span>
      </div>
    );
  }
}

export default Icone;