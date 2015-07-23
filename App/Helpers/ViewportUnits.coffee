Dimensions = require 'Dimensions'
{width, height} = Dimensions.get('window')

Units =
  vw: width/100
  vh: height/100

Units.vmin = Math.min(Units.vw, Units.vh)
Units.vmax = Math.max(Units.vw, Units.vh)

module.exports = Units
