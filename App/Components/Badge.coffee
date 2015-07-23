Styles = require('../Styles/RncStyles').Badge
React  = require 'react-native'
{ Text, View, Image } = React

class Badge extends React.Component
  render: ->
    <View style={Styles.container}>
      <Image source={{uri: @props.userInfo.avatar_url}}
             style={Styles.image} />
      <Text style={Styles.name}>{@props.userInfo.name}</Text>
      <Text style={Styles.handle}>{@props.userInfo.login}</Text>
    </View>

Badge.propTypes =
  userInfo: React.PropTypes.object.isRequired

module.exports = Badge
