fs = require('fs')
expect = require('chai').expect

tmp = require('./support/tmp')
createCabbageProject = require('./support/create-cabbage-project')

build = require('./../lib/commands/build')


describe 'Hello JavaScript', ->
  before (done) ->
    @timeout(30000)
    tmp.setCwd()
    createCabbageProject "pants", ->
      tmp.setCwd("pants")
      done()

  after ->
    @timeout(10000)
    tmp.clean()
    tmp.resetCwd()

  Given (done) -> build("dist", done)
  When -> @result = fs.readFileSync("dist/js/app.js").toString()
  Then -> expect(@result).to.contain("Hello, World!")
  And -> expect(@result).to.contain("JST['hello.us']")
  And -> expect(@result).to.contain("nativeForEach")
