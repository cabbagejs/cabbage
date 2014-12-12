minify = require('./../util/css/minify')
sass = require('./../util/css/sass')

merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
dupe = require('./../util/dupe')

module.exports = (config) ->
  minify(
    concat(dupe(gather(), sass), "css", config.concat.css)
  )

gather = ->
  merge(
    pick("vendor/css")
    pick("app/css")
  )
