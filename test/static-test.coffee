require('./support/spec-helper')

build = require('./support/build')

describe 'Static file paths', ->
  When (done) -> build(done)

  describe 'app/static', ->
    Given -> addFile('app/static/a', 'A')
    Then -> readFile('dist/a') == 'A'

  describe 'vendor/static', ->
    Given -> addFile('vendor/static/b', 'B')
    Then -> readFile('dist/b') == 'B'

  describe 'legacy dirs', ->
    describe 'app/img', ->
      Given -> addFile('app/img/c', 'C')
      Then -> readFile('dist/img/c') == 'C'

    describe 'vendor/img', ->
      Given -> addFile('vendor/img/d', 'D')
      Then -> readFile('dist/img/d') == 'D'

    describe 'vendor/webfonts', ->
      Given -> addFile('vendor/webfonts/e', 'E')
      Then -> readFile('dist/webfonts/e') == 'E'
