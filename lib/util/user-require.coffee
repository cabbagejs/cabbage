resolve = require('resolve')
_ = require('underscore')

module.exports = (p) ->
  require(unrequire(userProjectFile(p)))

userProjectFile = (p) ->
  resolve.sync(p,
    basedir: process.cwd()
    extensions: Object.keys(require.extensions)
  )

unrequire = (p) ->
  _(p).tap (p) -> delete require.cache[p]
