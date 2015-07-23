Styles = require('../Styles/RncStyles').Separator
React  = require 'react-native'
{ Text, View } = React

class Separator extends React.Component
  render: ->
    <View style={Styles.separator} />

module.exports = Separator
