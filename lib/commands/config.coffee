config = require('./../util/config')()
_ = require('underscore')

traverse = (paths, obj) ->
  if !obj? || !paths? || paths.length == 0
    obj
  else if _(paths[0]).include("[")
    [paths, prop, index] = paths[0].match(/(.*)\[(\d+)\]/)
    traverse(_(paths).rest(), obj[prop][index])
  else
    traverse(_(paths).rest(), obj[paths[0]])

module.exports = (configPath = undefined) ->
  console.log traverse(configPath?.split('.'), config)
