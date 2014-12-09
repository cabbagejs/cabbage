cabbageCli = require('cabbage-cli')

module.exports = (name, cb) ->
  resetLog = whack(console, "log")
  cabbageCli.commands.new name, (err) ->
    resetLog()
    cb(err)

whack = (owner, methodName) ->
  stub(owner, methodName, undefined)

stub = (owner, methodName, stubbing) ->
  originalMethod = owner[methodName]
  owner[methodName] = -> stubbing
  ->
    owner[methodName] = originalMethod
