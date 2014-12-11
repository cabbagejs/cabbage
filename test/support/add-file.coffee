fs = require('fs')
path = require('path')

# Adds a file to the example project and cleans it out afterEach
module.exports = (subPath, contents) ->
  p = path.resolve(process.cwd(), subPath)
  fs.writeFileSync(p, contents)
  afterEach ->
    try
      fs.unlinkSync(p)
    catch e
      # ¯\_(ツ)_/¯ -- this fails a bunch and i haven't looked into why
