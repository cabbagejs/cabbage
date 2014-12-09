fs = require('fs')
path = require('path')

module.exports = (relativePath) ->
  fs.existsSync(path.resolve(process.cwd(), relativePath))
