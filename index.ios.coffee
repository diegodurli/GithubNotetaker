React = require 'react-native'
{ AppRegistry } = React

App = require './App/Build/App'

AppRegistry.registerComponent 'githubNotetaker', () -> App
