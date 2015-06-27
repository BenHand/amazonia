/* globals React */
'use strict';

var Navigation = React.createClass({
    render: function () {
        return (
            <div role="navigation">
              <ul className='nav nav-tabs'>
                <NavLink name='Home' url='/' />
                <NavLink name='Products' url='/companies' />
                <NavLink name='Cart' url='/locations' />
              </ul>
            </div>
        );
    }
});

var NavLink = React.createClass({
        render: function() {
            return (
                <li role='presentation'>
                  <a onClick={this.clicked}>{this.props.name}</a>
                </li>
            );
},
clicked: function () {
    window.location.href = this.props.url;
    }
});