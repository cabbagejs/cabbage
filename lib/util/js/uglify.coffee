uglifyJs = require('broccoli-uglify-js');

env = require('./../env')()

module.exports = (inputTree, options = {}) ->
  return inputTree unless env == "production"
  uglifyJs(inputTree, options)
