_ = require('underscore')
config = require('./util/config')

module.exports = (configPath = undefined) ->
  traverse(configPath?.split('.'), config())

traverse = (paths, obj) ->
  if !obj? || !paths? || paths.length == 0
    obj
  else if _(paths[0]).include("[")
    [paths, prop, index] = paths[0].match(/(.*)\[(\d+)\]/)
    traverse(_(paths).rest(), obj[prop][index])
  else
    traverse(_(paths).rest(), obj[paths[0]])
