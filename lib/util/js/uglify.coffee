uglifyJs = require('broccoli-uglify-js');

config = require('./../config')()

module.exports = (inputTree, options = {}) ->
  return inputTree unless config.js.uglify.enable
  uglifyJs(inputTree, options)
