staticCompiler = require('broccoli-static-compiler')

exists = require('./exists')

NAMESPACE = "cabbage"

module.exports = (path, include = true, customNamespace = null) ->
  return if !include || !exists(path)
  staticCompiler path,
    srcDir: '/'
    destDir: customNamespace || "#{NAMESPACE}/#{path}"

module.exports.namespace = NAMESPACE
