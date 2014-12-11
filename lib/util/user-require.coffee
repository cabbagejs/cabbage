resolve = require('resolve')

module.exports = (path) ->
  require(resolve.sync(path,
    basedir: process.cwd()
    extensions: Object.keys(require.extensions)
  ))
