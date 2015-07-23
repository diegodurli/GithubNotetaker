Badge              = require './Badge'
{ Navigator }      = require('../Utils/RncUtils')
{ Web, Separator } = require('../Helpers/RncHelpers')
Styles             = require('../Styles/RncStyles').Repositories
sugar              = require 'sugar'
React              = require 'react-native'
{ Text, View, TouchableHighlight, ScrollView } = React

class Repositories extends React.Component
  constructor: (props) ->
    super(props)
    @navigator = new Navigator @props
  getDescriptionComponent: (desc) ->
    if desc
      <Text style={Styles.description}>{desc}</Text>
    else
      <View />

  openPage: (url, name) ->
    @navigator.go Web, name, url: url
  getRepos: ->
    repos = @props.repos

    if repos.isEmpty()
      return <View style={Styles.rowRepos}>
               <View style={Styles.noReposView}>
                <Text style={Styles.noReposText}>
                  {"#{@props.userInfo.login} doesn't have any public repositories yet."}
                </Text>
               </View>
             </View>

    list = repos.map (item, index) =>
      desc = @getDescriptionComponent(repos[index].description)
      <View key={index}>
        <View style={Styles.rowContainer}>
          <TouchableHighlight
            onPress={@openPage.bind(@, repos[index].html_url, repos[index].name)}
            underlayColor='transparent'>
            <Text style={Styles.name}>{repos[index].name}</Text>
          </TouchableHighlight>
          <Text style={Styles.stars}>
            Stars: {repos[index].stargazers_count}
          </Text>
          {desc}
        </View>
        <Separator />
      </View>

  render: ->
    <ScrollView style={Styles.container}>
      <Badge userInfo={@props.userInfo} />
      {@getRepos()}
    </ScrollView>

Repositories.propTypes =
  userInfo: React.PropTypes.object.isRequired
  repos: React.PropTypes.array.isRequired

module.exports = Repositories
