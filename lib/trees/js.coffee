_ = require('underscore')

exportTree = require('broccoli-export-tree')
coffee = require('broccoli-coffee')

merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
config = require('./../util/config')()
env = require('./../util/env')()
templates = require('./templates')


module.exports = ->
  js = coffee(merge(
    pick("vendor/js"),
    merge(pick("app/js"), templates()),
    pick("spec", env != "production")
  ))

  concatenated = concat(js, "js", config.concat.js)

  merge(
    concatenated,
    exportTree(concatenated, destDir: 'generated') if env != "production"
  )
