{ vw, vh, vmin, vmax } = require '../Helpers/ViewportUnits'

Styles =
  container:
    backgroundColor: '#48BBEC'
    paddingBottom: 10
    height: 30 * vh
  name:
    alignSelf: 'center'
    fontSize: 21
    marginTop: 10
    marginBottom: 5
    color: 'white'
  handle:
    alignSelf: 'center'
    fontSize: 16
    color: 'white'
  image:
    height: 125
    width: 125
    borderRadius: 65
    marginTop: 10
    alignSelf: 'center'

module.exports = Styles
