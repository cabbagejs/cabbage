staticCompiler = require('broccoli-static-compiler')

NAMESPACE = "cabbage"

module.exports = (name, include = true) ->
  return if !include
  staticCompiler name,
    srcDir: '/'
    destDir: "#{NAMESPACE}/#{name}"
