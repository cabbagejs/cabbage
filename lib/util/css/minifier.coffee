cleanCss = require('broccoli-clean-css')

env = require('./../env')()

module.exports = (inputTree, options = {}) ->
  return inputTree unless env == "production"
  cleanCss(inputTree, options)
