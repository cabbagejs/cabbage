TestemApi = require('testem')
path = require('path')

module.exports = ->
  process.env['CABBAGE_ENV'] ||= 'test'
  new TestemApi().startCI
    file: path.resolve(process.cwd(), "config", "spec.json")
