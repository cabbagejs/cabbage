module.exports = ->
  pipeline:
    js:
      uglify:
        enable: true
      concat:
        specs:
          enable: false
    css:
      minify:
        enable: true
