exportTree = require('broccoli-export-tree')
coffee = require('broccoli-coffee')

merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
configResolver = require('./../util/config')
env = require('./../util/env')()
templates = require('./templates')
uglify = require('./../util/js/uglify')

module.exports = ->
  config = configResolver()
  scripts = coffee(merge(
    pick("vendor/js"),
    merge(pick("app/js"), templates()),
    pick("spec", config.pipeline.js.concat.specs.enable)
  ))

  concatenated = concat(scripts, "js", config.concat.js)

  uglify(merge(
    concatenated,
    exportTree(concatenated, destDir: 'generated') if env != "production"
  ))
