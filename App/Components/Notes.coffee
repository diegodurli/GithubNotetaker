Styles        = require('../Styles/RncStyles').Notes
{ Api }       = require('../Utils/RncUtils')
{ Separator } = require('../Helpers/RncHelpers')
Badge         = require './Badge'
React         = require 'react-native'
{ Text, View, ListView, TextInput, TouchableHighlight } = React

class Notes extends React.Component
  constructor: (props) ->
    super(props)
    @ds = new ListView.DataSource rowHasChanged: (row1, row2) -> row1 isnt row2
    @state =
      dataSource: @ds.cloneWithRows @props.notes
      note: ''
      error: ''
  handleChange: (event) ->
    @setState
      note: event.nativeEvent.text
  handleSubmit: ->
    note = @state.note
    @setState
      note: ''

    Api.addNote @props.userInfo.login, note
      .then (data) =>
        Api.getNotes @props.userInfo.login
          .then (data) =>
            @setState
              dataSource: @ds.cloneWithRows data

      .catch (err) ->
        console.log err
        @setState
          error: err
  renderRow: (rowData) ->
    <View>
      <View style={Styles.rowContainer}>
        <Text>{rowData}</Text>
      </View>
      <Separator />
    </View>
  footer: ->
    <View style={Styles.footerContainer}>
      <TextInput
        style={Styles.searchInput}
        value={@state.note}
        onChange={@handleChange.bind(@)}
        placeholder='New Note' />
      <TouchableHighlight
        style={Styles.button}
        onPress={@handleSubmit.bind(@)}
        underlayColor='#88D4F5'>
        <Text style={Styles.buttonText}>Submit</Text>
      </TouchableHighlight>
    </View>
  getListViewHeader: ->
    <Badge userInfo={@props.userInfo} />
  render: ->
    <View style={Styles.container}>
      <ListView
        dataSource={@state.dataSource}
        renderRow={@renderRow}
        renderHeader={@getListViewHeader.bind(@)} />
      {@footer()}
    </View>

Notes.propTypes =
  userInfo: React.PropTypes.object.isRequired
  notes: React.PropTypes.object.isRequired

module.exports = Notes
