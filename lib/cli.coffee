module.exports = ->
  switch command()
    when 'run' then require('./commands/run')()
    when 'build' then require('./commands/build')()
    else
      console.error(helpText())
      process.exit(1)

command = ->
  process.argv[2]

helpText = ->
  """

    Usage: cabbage <command>

    Commands:

      run               start a broccoli server on port 8000
      build             build the project to the `dist` directory

  """
