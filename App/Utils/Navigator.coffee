
class Navigator
  constructor: (props) ->
    @navigator = props.navigator
  go: (component, title, props) ->
    @navigator.push
      title: title
      component: component
      passProps: props

module.exports = Navigator
