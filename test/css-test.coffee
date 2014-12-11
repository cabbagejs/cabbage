require('./support/spec-helper')

build = require('./support/build')

describe 'CSS', ->
  context 'Hello, World', ->
    Given (done) -> build(done)
    When -> @result = readFile("dist/css/app.css")
    Then -> expect(@result).to.contain("background-color:#efefef")

  context 'Sass', ->
    Around -> addFile 'app/css/main.sass', """
      body
        width: 80%
      """
    Given (done) -> build(done)
    When -> @result = readFile("dist/css/app.css")
    Then -> expect(@result).to.contain("background-color:#efefef")
    And -> expect(@result).to.contain("width:80%")
