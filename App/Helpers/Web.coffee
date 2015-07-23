Styles = require('../Styles/RncStyles').Web
React  = require 'react-native'
{ Text, View, WebView } = React

class Web extends React.Component
  render: ->
    <View style={Styles.container}>
      <WebView url={@props.url} />
    </View>

Web.propTypes =
  url: React.PropTypes.string.isRequired

module.exports = Web
