broccoliConcat = require('broccoli-concat')
_ = require('underscore')

merge = require('./../util/merge')
env = require('./env')()

NAMESPACE = "cabbage"

module.exports = (inputTree, dest, bundles) ->
  merge(_(bundles).map (bundle, name) ->
    return unless _(bundle.env).include(env)
    broccoliConcat inputTree,
      inputFiles: _(bundle.files).map (path) -> "#{NAMESPACE}/#{path}"
      outputFile: "/#{dest}/#{name}.js"
      wrapInFunction: false
      allowNone: true
  )
