merge = require('./util/merge')
config = require('./util/config')

module.exports = ->
  c = config()
  merge(
    require('./trees/js')(c),
    require('./trees/css')(c),
    require('./trees/pages')(c),
    require('./trees/static')(c)
  )
