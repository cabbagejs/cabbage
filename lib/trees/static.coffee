pick = require('./../util/pick')
merge = require('./../util/merge')


module.exports = ->
  merge(
    pick('vendor/static', true, '/'),
    pick('app/static', true, '/'),
    pick('vendor/img', true, '/img'),
    pick('app/img', true, '/img')
  )
