staticCompiler = require('broccoli-static-compiler')

NAMESPACE = "cabbage"

module.exports = (path, include = true, customNamespace = null) ->
  return if !include
  staticCompiler path,
    srcDir: '/'
    destDir: customNamespace || "#{NAMESPACE}/#{path}"

module.exports.namespace = NAMESPACE
