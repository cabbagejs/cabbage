pick = require('./../util/pick')
merge = require('./../util/merge')


module.exports = ->
  merge(
    pick('app/static', true, '/')
  )
