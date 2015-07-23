Main   = require './Components/Main'
Styles = require('./Styles/RncStyles').App
React  = require 'react-native'
{ NavigatorIOS } = React

class GithubNotetaker extends React.Component
  render: ->
    <NavigatorIOS
      style={Styles.container}
      initialRoute={{title: 'Github Notetaker', component: Main}} />

module.exports = GithubNotetaker
