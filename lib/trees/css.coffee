_ = require('underscore')


merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
config = require('./../util/config')()
env = require('./../util/env')()
templates = require('./templates')


module.exports = ->
  css = merge(
    pick("vendor/css"),
    pick("app/css")
  )

  concat(css, "css", config.concat.css)
