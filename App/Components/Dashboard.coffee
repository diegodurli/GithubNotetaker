Styles = require('../Styles/RncStyles').Dashboard
React  = require 'react-native'
sugar  = require 'sugar'
{ Navigator, Api } = require('../Utils/RncUtils')
{ Text, View, Image, TouchableHighlight  } = React

Profile      = require './Profile'
Repositories = require './Repositories'
Notes        = require './Notes'

class Dashboard extends React.Component
  constructor: (props) ->
    super(props)
    @navigator = new Navigator @props
  goToProfile: ->
    @navigator.go Profile, 'Profile', {userInfo: @props.userInfo}
  goToRepos: ->
    Api.getRepos @props.userInfo.login
      .then (res) =>
        if Object.isArray(res)
          @navigator.go Repositories, 'Repositories',
            userInfo: @props.userInfo
            repos: res
  goToNotes: ->
    Api.getNotes @props.userInfo.login
      .then (res) =>
        res = res || {}
        @navigator.go Notes, 'Notes', userInfo: @props.userInfo, notes: res
  render: ->
    <View style={Styles.container}>
      <Image source={{uri: @props.userInfo.avatar_url}}
             style={Styles.image} />
      <TouchableHighlight
        style={Styles.profileButton}
        onPress={@goToProfile.bind(@)}
        underlayColor='#88D4F5'>
        <Text style={Styles.buttonText}>View Profile</Text>
      </TouchableHighlight>
      <TouchableHighlight
        style={Styles.reposButton}
        onPress={@goToRepos.bind(@)}
        underlayColor='#88D4F5'>
        <Text style={Styles.buttonText}>View Repositories</Text>
      </TouchableHighlight>
      <TouchableHighlight
        style={Styles.notesButton}
        onPress={@goToNotes.bind(@)}
        underlayColor='#88D4F5'>
        <Text style={Styles.buttonText}>View Notes</Text>
      </TouchableHighlight>
    </View>

module.exports = Dashboard
