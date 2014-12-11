extend = require('config-extend')
env = require('./env')()

evaluateTemplateTree = require('./../evaluate-template-tree')
userRequire = require('./user-require')

masterFileConfig = require('./../../config/files')
masterAppConfig = require('./../../config/application')
masterEnvConfig = require("./../../config/#{env}")
userFileConfig = userRequire('./config/files')
userAppConfig = userRequire('./config/application')
userEnvConfig = userRequire("./config/#{env}")

module.exports = ->
  config = extend(masterAppConfig(), files:masterFileConfig(), masterEnvConfig(),
                  userAppConfig(),   files:userFileConfig(),   userEnvConfig())
  evaluateTemplateTree(config, config)
