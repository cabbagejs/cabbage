extend = require('config-extend')
env = require('./env')

evaluateTemplateTree = require('./../evaluate-template-tree')
userRequire = require('./user-require')

module.exports = ->
  e = env()
  masterFileConfig = require('./../../config/files')
  masterAppConfig = require('./../../config/application')
  masterEnvConfig = require("./../../config/#{e}")
  userFileConfig = userRequire('./config/files')
  userAppConfig = userRequire('./config/application')
  userEnvConfig = userRequire("./config/#{e}")

  config = extend(masterAppConfig(), files:masterFileConfig(), masterEnvConfig(),
                  userAppConfig(),   files:userFileConfig(),   userEnvConfig())
  evaluateTemplateTree(config, config)
