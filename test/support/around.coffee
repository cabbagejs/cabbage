module.exports = (before) ->
  doAfter = null
  Given -> doAfter = before()
  afterEach ->
    console.log "cleanup: #{before.toString()}"
    doAfter?()
