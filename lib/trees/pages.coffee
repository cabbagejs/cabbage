_ = require('underscore')

pick = require('./../util/pick')
subtree = require('./../util/subtree')
config = require('./../util/config')
serverSideTemplates = require('./../plugins/server-side-templates')

module.exports = ->
  subtree(
    serverSideTemplates pick("app/pages"),
      extensions: ["us"]
      compileFunction: _.template
      context: config().pages.context
  , "#{pick.namespace}/app/pages")
