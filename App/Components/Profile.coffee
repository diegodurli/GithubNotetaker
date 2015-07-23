React         = require 'react-native'
Badge         = require './Badge'
{ Separator } = require '../Helpers/RncHelpers'
Sugar         = require 'sugar'
Styles        = require('../Styles/RncStyles').Profile

{ Text, View, ScrollView } = React

class Profile extends React.Component
  constructor: (props) ->
    super(props)
  createViewsForUserInfo: ->
    userInfoDetails = ['company','location','followers',
                       'following','email','bio','public_repos']

    list = userInfoDetails.map (item, index) =>
      if not @props.userInfo[item]
        return <View key={index} />
      else
        <View key={index}>
          <View style={Styles.rowContainer}>
            <Text style={Styles.rowTitle}>
              {item.titleize()}
            </Text>
            <Text style={Styles.rowContent}>
              {@props.userInfo[item]}
            </Text>
          </View>
          <Separator />
        </View>

  render: ->
    <ScrollView
      style={Styles.container}>
      <Badge userInfo={@props.userInfo} />
      {@createViewsForUserInfo()}
    </ScrollView>

module.exports = Profile
