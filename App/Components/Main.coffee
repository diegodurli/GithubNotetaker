{ Api, Navigator } = require('../Utils/RncUtils')
Styles             = require('../Styles/RncStyles').Main
{ Dashboard }      = require('./RncComponents')

React = require 'react-native'
{ Text, View, TextInput, TouchableHighlight, ActivityIndicatorIOS  } = React

class Main extends React.Component
  constructor: (props) ->
    super(props)
    @navigator = new Navigator @props
    @state =
      username: ''
      isLoading: false
      error: false
  handleChange: (event) ->
    @setState
      username: event.nativeEvent.text
  showError: ->
    if @state.error
      <Text style={Styles.error}>{@state.error}</Text>
    else
      <View></View>
  handleSubmit: ->
    @setState
      isLoading: true

    Api.getBio @state.username
      .then (res) =>
        if res.message is 'Not Found'
          @setState
            error: 'User not found'
            isLoading: false
        else
          @navigator.go Dashboard, res.name || 'Select an Option', {userInfo: res}
          @setState
            isLoading: false
            error: false
            username: ''

  render: ->
    <View style={Styles.mainContainer}>
      <TextInput
        style={Styles.searchInput}
        value={@state.username}
        placeholder='Search for a Github User...'
        placeholderTextColor='#B2DFDB'
        onChange={@handleChange.bind(@)}
      />
      <TouchableHighlight
        style={Styles.button}
        onPress={@handleSubmit.bind(@)}
        underlayColor='white'>
        <Text style={Styles.buttonText}>SEARCH</Text>
      </TouchableHighlight>
      <ActivityIndicatorIOS
        style={Styles.loading}
        animating={@state.isLoading}
        color='#111'
        size='large'></ActivityIndicatorIOS>
      {@showError()}
    </View>

module.exports = Main
