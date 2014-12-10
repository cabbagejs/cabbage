require('./support/spec-helper')

fs = require('fs')
expect = require('chai').expect


build = require('./../lib/commands/build')

describe 'Hello JavaScript', ->
  Given (done) -> build("dist", done)
  When -> @result = fs.readFileSync("dist/js/app.js").toString()
  Then -> expect(@result).to.contain("Hello, World!")
  And -> expect(@result).to.contain("JST['hello.us']")
  And -> expect(@result).to.contain("nativeForEach")
