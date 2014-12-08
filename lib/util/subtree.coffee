Funnel = require('broccoli-funnel')

module.exports = (inputTree, srcDir) ->
  new Funnel inputTree, {srcDir}
