_ = require('underscore')

pick = require('./../util/pick')
subtree = require('./../util/subtree')
serverSideTemplates = require('./../plugins/server-side-templates')

module.exports = (config) ->
  subtree(
    serverSideTemplates(pick("app/pages"), underscoreConfig(config))
  , "#{pick.namespace}/app/pages")

underscoreConfig = (config) ->
  extensions: ["us"]
  compileFunction: _.template
  context: config.pages.context
