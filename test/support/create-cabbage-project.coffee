fs = require('fs')
path = require('path')
tmp = require('./tmp')
mkdirp = require('mkdirp')
cabbageCli = require('cabbage-cli')

module.exports = (name, cb) ->
  resetLog = whack(console, "log")
  cabbageCli.commands.new name, true, (err) ->
    resetLog()
    return cb(err) if err?
    symlinkCabbageAndBroccoli(name)
    cb(null)

symlinkCabbageAndBroccoli = (name) ->
  mkdirp.sync(path.resolve(process.cwd(), name, "node_modules"))
  fs.symlinkSync(tmp.originalCwd(), path.resolve(process.cwd(), name, "node_modules", "cabbage"))
  fs.symlinkSync(path.resolve(tmp.originalCwd(), "node_modules", "broccoli"), path.resolve(process.cwd(), name, "node_modules", "broccoli"))

whack = (owner, methodName) ->
  stub(owner, methodName, undefined)

stub = (owner, methodName, stubbing) ->
  originalMethod = owner[methodName]
  owner[methodName] = -> stubbing
  ->
    owner[methodName] = originalMethod
