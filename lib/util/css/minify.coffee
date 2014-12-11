cleanCss = require('broccoli-clean-css')

config = require('./../config')()

module.exports = (inputTree, options = {}) ->
  return inputTree unless config.css.minify.enable
  cleanCss(inputTree, options)
