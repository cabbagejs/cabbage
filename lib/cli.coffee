module.exports = ->
  switch command()
    when 'run' then require('./commands/run')()
    when 'build' then require('./commands/build')()
    when 'spec' then require('./commands/spec')()
    when 'spec-ci' then require('./commands/spec-ci')()
    when 'clean' then require('./commands/clean')()
    when 'config' then require('./commands/config')(process.argv[3])
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
      spec              run the project's tests in an ongoing testem process
      spec-ci           run the project's tests in a headless CI testem process
      config            displays the project's configuration

  """
