pick = require('./../util/pick')
merge = require('./../util/merge')

config = require('./../util/config')()

module.exports = ->
  merge(
    pick('vendor/static', true, '/'),
    pick('app/static', true, '/'),
    pick('vendor/img', true, config.files.img.root),
    pick('app/img', true, config.files.img.root),
    pick('vendor/webfonts', true, config.files.webfonts.root)
  )
