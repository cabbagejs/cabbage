userRequire = require('./../util/user-require')
broccoli = userRequire('broccoli')

module.exports = ->
  process.env['CABBAGE_ENV'] ||= 'development'
  builder = new broccoli.Builder(broccoli.loadBrocfile())
  broccoli.server.serve builder,
    port: 8000
    host: "localhost"
    liveReloadPort: 35729
