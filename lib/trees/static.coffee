pick = require('./../util/pick')
merge = require('./../util/merge')

configResolver = require('./../util/config')

module.exports = ->
  config = configResolver()
  merge(
    pick('vendor/static', true, '/'),
    pick('app/static', true, '/'),
    pick(config.files.img.vendor, true, config.files.img.root),
    pick(config.files.img.app, true, config.files.img.root),
    pick(config.files.webfonts.vendor, true, config.files.webfonts.root)
  )
