require('./support/spec-helper')

build = require('./support/build')

describe 'JavaScript', ->
  Initially (done) -> build(done)
  When -> @result = readFile("dist/js/app.js")
  Then -> expect(@result).to.contain("Hello, World!")
  And -> expect(@result).to.contain("JST['hello.us']")
  And -> expect(@result).to.contain("nativeForEach")
