staticCompiler = require('broccoli-static-compiler')
mergeTrees = require('broccoli-merge-trees')
broccoliConcat = require('broccoli-concat')
exportTree = require('broccoli-export-tree')

files = require('./../build-file-config')()
env = require('./../env')()
_ = require('underscore')

NAMESPACE = "cabbage/js"

module.exports = ->
  js = merge(
    sourceTree("vendor/js"),
    sourceTree("app/js"),
    sourceTree("spec", env != "production")
  )

  concatenated = merge(
    concat(js, "app"),
    concat(js, "spec", env != "production")
  )

  exportTree concatenated,
    destDir: 'generated'

merge = (trees...) ->
  mergeTrees(_(trees).compact())

sourceTree = (name, include = true) ->
  return if !include
  staticCompiler name,
    srcDir: '/'
    destDir: "#{NAMESPACE}/#{name}"

concat = (jsTree, name, include = true) ->
  return if !include
  broccoliConcat jsTree,
    inputFiles: _(files.concat.js[name]).map (path) -> "#{NAMESPACE}/#{path}"
    outputFile: "/js/#{name}.js"
    wrapInFunction: false
    allowNone: true
