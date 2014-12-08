merge = require('./util/merge')

module.exports = ->
  merge(
    require('./trees/js')()
  )
