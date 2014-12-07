extend = require('config-extend')
resolve = require('resolve')

evaluateTemplateTree = require('./evaluate-template-tree')

masterConfig = require('./../config/files')
userConfig = require(resolve.sync('./config/files', basedir: process.cwd()))

module.exports = ->
  config = extend(masterConfig(), userConfig())
  evaluateTemplateTree(config, files: config)
