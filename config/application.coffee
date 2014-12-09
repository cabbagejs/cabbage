# Exports an object that defines
#   all of the app config that the project
#   is concerned with.

module.exports = ->
  concat:
    js:
      app:
        files: [
          "<%= files.js.vendor %>"
          "<%= files.js.app %>"
        ]

      spec:
        env: ["development", "test"]
        files: [
          "<%= files.js.vendor %>"
          "<%= files.js.app %>"
          "<%= files.js.specHelpers %>"
          "<%= files.js.spec %>"
        ]

    css:
      app:
        files: [
          "<%= files.css.vendor %>"
          "<%= files.css.app %>"
        ]

  pages:
    context:
      js: "<%= files.js.minifiedWebRelative %>"
      css: "<%= files.css.minifiedWebRelative %>"
