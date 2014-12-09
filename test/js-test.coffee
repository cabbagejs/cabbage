expect = require('chai').expect

describe 'foo', ->
  Given -> @subject = 1
  When -> @subject++
  Then -> @subject == 2
