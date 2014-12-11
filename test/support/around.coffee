module.exports = (before) ->
  doAfter = null
  Given -> doAfter = before()
  afterEach ->
    doAfter?()
