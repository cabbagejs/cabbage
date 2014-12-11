getConfig = require('./../get-config')

module.exports = (configPath = undefined) ->
  console.log(getConfig(configPath))
