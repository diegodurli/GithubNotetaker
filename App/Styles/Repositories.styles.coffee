{ vw, vh, vmin, vmax } = require '../Helpers/ViewportUnits'

Styles =
  container:
    flex: 1
  rowContainer:
    flexDirection: 'column'
    flex: 1
    padding: 10
  rowRepos:
    flex: 1
    justifyContent: 'center'
    alignItems: 'center'
    height: 60 * vh
  noReposView:
    borderWidth: 1
    borderRadius: 4
    backgroundColor: '#F5F5F5'
    borderColor: '#9E9E9E'
    padding: 10
    alignSelf: 'center'
    justifyContent: 'center'
    height: 30
  noReposText:
    fontWeight: 'bold'
    fontSize: 12
  name:
    color: '#48BBEC'
    fontSize: 14
    paddingBottom: 5
  stars:
    color: '#48BBEC'
    fontSize: 14
    paddingBottom: 5
  description:
    fontSize: 14
    paddingBottom: 5

module.exports = Styles
