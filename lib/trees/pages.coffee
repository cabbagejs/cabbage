_ = require('underscore')

pick = require('./../util/pick')
config = require('./../util/config')
serverSideTemplates = require('./../plugins/server-side-templates')

module.exports = ->
  serverSideTemplates pick("app/pages"),
    extensions: ["us"]
    compileFunction: _.template
    context:
      pkg: "HI"
      css: "GRR"
      js: "lol"
