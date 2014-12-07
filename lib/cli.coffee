module.exports = ->
  switch command()
    when 'build' then require('./commands/build')()

command = ->
  process.argv[2]
