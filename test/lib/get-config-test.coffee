require('./../support/spec-helper')

config = require('./../../lib/util/config')

describe 'Config', ->
  Given -> @subject = require('./../../lib/get-config')

  context 'no arg', ->
    Then -> expect(@subject()).to.deep.equal(config())

  context 'specific default app property', ->
    Then -> @subject('pages.context.js') == 'js/app.js'

  context 'user overridden app property', ->
    Given -> replaceFile 'config/application.js', """
      module.exports = function() {
        console.log("ZOMG")
        return {
          pages: {
            context: {
              js: "pants"
            }
          }
        };
      };
      """
    Then -> @subject('pages.context.js') == 'pants'
