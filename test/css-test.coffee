require('./support/spec-helper')

build = require('./../lib/commands/build')

describe 'Hello CSS', ->
  Initially (done) -> build("dist", done)
  When -> @result = fs.readFileSync("dist/css/app.css").toString()
  Then -> expect(@result).to.contain("background-color:#efefef")
