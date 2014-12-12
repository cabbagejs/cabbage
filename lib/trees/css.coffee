minify = require('./../util/css/minify')
sass = require('./../util/css/sass')

merge = require('./../util/merge')
pick = require('./../util/pick')
concat = require('./../util/concat')
config = require('./../util/config')

module.exports = ->
  styles = merge(
    pick("vendor/css"),
    pick("app/css")
  )

  minify(concat(merge(styles, sass(styles)), "css", config().concat.css))
