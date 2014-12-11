module.exports = ->
  pipeline:
    js:
      uglify:
        enable: true
      concat:
        specs:
          enable: true
    css:
      minify:
        enable: true
