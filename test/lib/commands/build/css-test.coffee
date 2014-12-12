build = require('./../../../support/spec-helper')

describe 'CSS', ->
  Given -> @subject = require('./build-helper')

  context 'Hello, World', ->
    Given (done) -> @subject(done)
    When -> @result = readFile("dist/css/app.css")
    Then -> expect(@result).to.contain("background-color:#efefef")

  context 'Sass', ->
    Around -> addFile 'app/css/main.sass', """
      body
        width: 80%
      """
    Given (done) -> @subject(done)
    When -> @result = readFile("dist/css/app.css")
    Then -> expect(@result).to.contain("background-color:#efefef")
    And -> expect(@result).to.contain("width:80%")
