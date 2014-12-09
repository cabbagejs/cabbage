_ = require('underscore')

clientSideTemplates = require('./../plugins/client-side-templates')
pick = require('./../util/pick')

NAMESPACE = "cabbage/app/js/templates"

module.exports = ->
  clientSideTemplates pick("app/templates", true, NAMESPACE),
    extensions: ["us"]
    compileFunction: _.template
    namespace: NAMESPACE
