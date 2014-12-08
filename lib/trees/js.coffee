merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')

exportTree = require('broccoli-export-tree')

config = require('./../util/config')()
env = require('./../util/env')()

module.exports = ->
  js = merge(
    pick("vendor/js"),
    pick("app/js"),
    pick("spec", env != "production")
  )

  concatenated = concat(js, "js", config.concat.js)

  merge(
    concatenated,
    exportTree(concatenated, destDir: 'generated') if env != "production"
  )
