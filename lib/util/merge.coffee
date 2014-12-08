_ = require('underscore')
mergeTrees = require('broccoli-merge-trees')

module.exports = (trees...) ->
  mergeTrees(_(trees).chain().flatten().compact().value())
