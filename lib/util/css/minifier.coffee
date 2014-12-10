cssCleaner = require('broccoli-clean-css')

env = require('./../env')()

module.exports = (inputTree, options) ->
  resultingTree = inputTree

  resultingTree = cssCleaner(inputTree, options) if env == "production"

  resultingTree