extend = require('config-extend')

evaluateTemplateTree = require('./../evaluate-template-tree')
userRequire = require('./user-require')

masterFileConfig = require('./../../config/files')
masterAppConfig = require('./../../config/application')
userFileConfig = userRequire('./config/files')
userAppConfig = userRequire('./config/application')
userEnvConfig = userRequire("./config/#{require('./env')()}")

module.exports = ->
  config = extend(masterAppConfig(), files: masterFileConfig(), userAppConfig(), files:userFileConfig(), userEnvConfig())
  evaluateTemplateTree(config, config)
