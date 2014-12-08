extend = require('config-extend')
resolve = require('resolve')

evaluateTemplateTree = require('./evaluate-template-tree')

masterFileConfig = require('./../config/files')
masterAppConfig = require('./../config/application')
userFileConfig = require(resolve.sync('./config/files', basedir: process.cwd()))
userAppConfig = require(resolve.sync('./config/application', basedir: process.cwd()))

module.exports = ->
  config = extend(masterAppConfig(), files: masterFileConfig(), userAppConfig(), files:userFileConfig())
  evaluateTemplateTree(config, config)
