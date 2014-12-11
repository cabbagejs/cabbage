fs = require('fs')

module.exports = (path) ->
  fs.readFileSync(path).toString()
