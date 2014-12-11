require('./../support/spec-helper')

config = require('./../../lib/util/config')

describe 'Config', ->
  Given -> @subject = require('./../../lib/get-config')

  context 'no arg', ->
    Then -> expect(@subject()).to.deep.equal(config())
