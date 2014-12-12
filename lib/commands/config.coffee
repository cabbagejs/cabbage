getConfig = require('./../get-config')
prettyPrinter = require('./../util/pretty-printer')

module.exports = (configPath = undefined) ->
  console.log(prettyPrinter(getConfig(configPath)))
