merge = require('./util/merge')

module.exports = ->
  merge(
    require('./trees/js')(),
    require('./trees/css')(),
    require('./trees/pages')(),
    require('./trees/static')()
  )
