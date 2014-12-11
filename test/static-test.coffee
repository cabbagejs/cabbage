require('./support/spec-helper')

build = require('./support/build')

describe 'static tests', ->
  describe 'app/static', ->
    Given -> addFile('app/static/a', 'A')
    Given (done) -> build(done)
    When -> @result = readFile('dist/a')
    Then -> @result == 'A'
