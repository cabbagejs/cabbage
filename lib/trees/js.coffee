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
    sourceTree("spec", notProduction())
  )

  concatenated = merge(
    concat(js, "app"),
    concat(js, "spec", notProduction())
  )
  merge(
    concatenated,
    exportTree(concatenated, destDir: 'generated') if notProduction()
  )


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

notProduction = -> env != "production"
