_ = require('underscore')

module.exports = ->
  switch command()
    when 'build' then require('./commands/build')()

command = ->
  _(process.argv).last()
