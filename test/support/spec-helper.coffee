# In this suite, Given will be unusable so `before` (all) is used until this is fixed: https://github.com/rendro/mocha-given/issues/2
global.Initially = before
global.Finally = after

# Lazy global conveniences are lazy
global.expect = require('chai').expect
global.fs = require('fs')
global.addFile = require('./add-file')
global.readFile = require('./read-file')

# Create a project for all the tests to run in and use
createCabbageProject = require('./create-cabbage-project')
tmp = require('./tmp')

Initially (done) ->
  @timeout(60000)
  tmp.setCwd()
  createCabbageProject "pants", ->
    tmp.setCwd("pants")
    done()

Finally ->
  @timeout(10000)
  tmp.resetCwd()
  tmp.clean()
