_ = require('underscore')
rimraf = require('rimraf')
path = require('path')

module.exports = ->
  _(["dist", "generated", "tmp"]).each (p) ->
    rimraf.sync(path.resolve(process.cwd(), p))
