readFile = require('./read-file')
addFile = require('./add-file')

# Replaces a file's contents and replaces them in a return func
# Use with global.Around
module.exports = (path, contents) ->
  originalContents = readFile(path)
  addFile(path, contents)
  ->
    addFile(path, originalContents)
