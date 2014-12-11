require('./support/spec-helper')

build = require('./support/build')

describe 'JavaScript', ->
  Initially (done) -> build(done)
  When -> @result = fs.readFileSync("dist/js/app.js").toString()

  context "Concatenation", ->
    Then -> expect(@result).to.contain("Hello, World!")
    And -> expect(@result).to.contain('JST["hello.us"]')
    And -> expect(@result).to.contain("nativeForEach")

  context 'Uglification', ->
    Initially -> addFile 'app/js/comments.js', """
      // this is a comment
      /* and is this */
      var thisExample = "Another great test";
      """
    Initially (done) -> build(done)

    Then -> expect(@result).to.contain("Another great test")
    And -> expect(@result).not.to.contain("this is a comment")
    And -> expect(@result).not.to.contain("and is this")
    And -> expect(@result).not.to.contain("//")
    And -> expect(@result).not.to.contain("/*")
