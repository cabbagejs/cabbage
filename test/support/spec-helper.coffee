# In this suite, Given will be `before` (all) until this is fixed: https://github.com/rendro/mocha-given/issues/2
global.Given = before
global.Finally = after

# Create a project for all the tests to run in and use
createCabbageProject = require('./create-cabbage-project')
tmp = require('./tmp')

Given (done) ->
  @timeout(60000)
  tmp.setCwd()
  createCabbageProject "pants", ->
    tmp.setCwd("pants")
    done()

Finally ->
  @timeout(10000)
  tmp.resetCwd()
  tmp.clean()
