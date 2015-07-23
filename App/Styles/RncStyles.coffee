StyleSheet = require('react-native').StyleSheet

RncStyles = Object.assign {},
  App: StyleSheet.create require './App.styles'
  Badge: StyleSheet.create require './Badge.styles'
  Dashboard: StyleSheet.create require './Dashboard.styles'
  Main: StyleSheet.create require './Main.styles'
  Profile: StyleSheet.create require './Profile.styles'
  Repositories: StyleSheet.create require './Repositories.styles'
  Separator: StyleSheet.create require './Separator.styles'
  Web: StyleSheet.create require './Web.styles'
  Notes: StyleSheet.create require './Notes.styles'

module.exports = RncStyles
