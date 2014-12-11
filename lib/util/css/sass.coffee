_ = require('underscore')
sass = require('broccoli-sass')

merge = require('./../merge')
config = require('./../config')()
pick = require('./../pick')
exists = require('./../exists')

module.exports = (inputTree) ->
  return unless main = _(config.files.sass.main).find(exists)
  sass([sassLoadPaths()], "#{pick.namespace}/#{main}", "#{pick.namespace}/#{config.files.sass.generatedApp}")

sassLoadPaths = ->
  # this is unusual/different because the load paths have to be a single merged tree for app to ever import from vendor:
  merge(pick("app/css"), pick("vendor/css", true, "#{pick.namespace}/app/css"))
