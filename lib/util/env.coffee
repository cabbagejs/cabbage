module.exports = ->
  process.env["CABBAGE_ENV"] || require('broccoli-env').getEnv()
