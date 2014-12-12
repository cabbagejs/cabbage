build = require('./../../../support/spec-helper')

describe 'JavaScript', ->
  Given -> @subject = require('./build-helper')

  When -> @result = readFile("dist/js/app.js")

  context "Concatenation", ->
    Given (done) -> @subject(done)
    Then -> expect(@result).to.contain("Hello, World!")
    And -> expect(@result).to.contain('JST["hello.us"]')
    And -> expect(@result).to.contain("nativeForEach")

  context 'Uglification', ->
    Around -> addFile 'app/js/comments.js', """
      // this is a comment
      /* and is this */
      var thisExample = "Another great test";
      """
    Given (done) -> @subject(done)

    Then -> expect(@result).to.contain("Another great test")
    And -> expect(@result).not.to.contain("this is a comment")
    And -> expect(@result).not.to.contain("and is this")
    And -> expect(@result).not.to.contain("//")
    And -> expect(@result).not.to.contain("/*")
