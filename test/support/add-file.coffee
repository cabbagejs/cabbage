fs = require('fs')
path = require('path')
mkdirp = require('mkdirp')

# Adds a file to the example project and cleans it out in a return func
# Use with global.Around
module.exports = (subPath, contents) ->
  p = path.resolve(process.cwd(), subPath)
  mkdirp.sync(path.dirname(p))
  fs.writeFileSync(p, contents)
  ->
    fs.unlinkSync(p)
