fs = require('fs')
path = require('path')

# Adds a file to the example project and cleans it out afterAll
module.exports = (subPath, contents) ->
  p = path.resolve(process.cwd(), subPath)
  fs.writeFileSync(p, contents)
  after ->
    # fs.unlinkSync(p)
