_ = require('underscore')

clientSideTemplates = require('./../plugins/client-side-templates')
pick = require('./../util/pick')

NAMESPACE = "#{pick.namespace}/app/js/templates"

module.exports = ->
  clientSideTemplates(
    pick("app/templates", true, NAMESPACE)
    underscoreConfig()
  )

underscoreConfig = ->
  extensions: ["us"]
  compileFunction: _.template
  namespace: NAMESPACE
