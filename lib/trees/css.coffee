

merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
config = require('./../util/config')()

module.exports = ->
  styles = merge(
    pick("vendor/css"),
    pick("app/css")
  )

  concat(merge(styles, sassTree(styles)), "css", config.concat.css)

_ = require('underscore')
sass = require('broccoli-sass')
exists = require('./../util/exists')
sassTree = (inputTree) ->
  return unless main = _(config.files.sass.main).find(exists)
  sass([sassLoadPaths()], "#{pick.namespace}/#{main}", "#{pick.namespace}/#{config.files.sass.generatedApp}")

sassLoadPaths = ->
  # this is unusual/different because the load paths have to be a single merged tree for app to ever import from vendor:
  merge(pick("app/css"), pick("vendor/css", true, "#{pick.namespace}/app/css"))
