broccoli = require(require('resolve').sync('broccoli', basedir: process.cwd()))

module.exports = ->
  process.env['CABBAGE_ENV'] ||= 'development'
  builder = new broccoli.Builder(broccoli.loadBrocfile())
  broccoli.server.serve builder,
    port: 8000
    host: "localhost"
    liveReloadPort: 35729
