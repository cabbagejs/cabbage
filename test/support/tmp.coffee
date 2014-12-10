path = require('path')
os = require('os')
mkdirp = require('mkdirp')
fs = require('fs')
rimraf = require('rimraf')

p = path.resolve(os.tmpdir(), "com.testdouble.cabbage", String(new Date().getTime()))
cwd = process.cwd()

module.exports = tmp =
  path: ->
    mkdirp.sync(p) unless fs.existsSync(p)
    p

  clean: ->
    rimraf.sync(p)

  originalCwd: -> cwd

  setCwd: (subPath = "") ->
    process.chdir(path.resolve(tmp.path(), subPath))

  resetCwd: ->
    process.chdir(tmp.originalCwd())
