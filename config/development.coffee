module.exports = ->
  pipeline:
    js:
      uglify:
        enable: false
      concat:
        specs:
          enable: true

    css:
      minify:
        enable: false
