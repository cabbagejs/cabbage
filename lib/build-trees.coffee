mergeTrees = require('broccoli-merge-trees')

module.exports = ->
  mergeTrees([require('./trees/js')()])
