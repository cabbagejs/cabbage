path = require('path')

build = require('./../../lib/commands/build')

module.exports = (cb) ->
  build "dist", (err, builder) ->
    delete require.cache[path.resolve(process.cwd(), "Brocfile.js")]
    cb(err)
