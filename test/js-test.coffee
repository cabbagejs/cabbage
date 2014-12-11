require('./support/spec-helper')

build = require('./support/build')

describe 'JavaScript', ->
  Initially (done) -> build(done)
  When -> @result = fs.readFileSync("dist/js/app.js").toString()
  Then -> expect(@result).to.contain("Hello, World!")
  And -> expect(@result).to.contain("JST['hello.us']")
  And -> expect(@result).to.contain("nativeForEach")
