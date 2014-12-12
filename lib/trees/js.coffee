exportTree = require('broccoli-export-tree')
coffee = require('broccoli-coffee')

merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
dupe = require('./../util/dupe')
templates = require('./templates')
uglify = require('./../util/js/uglify')
env = require('./../util/env')

module.exports = (config) ->
  uglify(
    dupe(
      concat(coffee(gather(config)), "js", config.concat.js)
      duplicateForFileExport
    )
  )

gather = (config) ->
  merge(
    pick("vendor/js")
    merge(pick("app/js"), templates())
    pick("spec", config.pipeline.js.concat.specs.enable)
  )

duplicateForFileExport = (inputTree) ->
  exportTree(inputTree, destDir: 'generated') if env() != "production"
