_ = require("underscore")

replacer = (key, value) ->
  if _(value).isFunction() then "[Function]" else value

module.exports = (value) ->
  return value if _(value).isString()
  try
    JSON.stringify(value, replacer, indentation = 2)
  catch e
    value
