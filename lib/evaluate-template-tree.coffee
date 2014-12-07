_ = require('underscore')

module.exports = (config, data) ->
  evaluate(config, data)

evaluate = (config, data) ->
  if _(config).isArray()
    _(config).map (value) ->
      evaluate(value, data)
  else if _(config).isObject()
    _(config).reduce (memo, value, key) ->
      memo[key] = evaluate(value, data)
      memo
    , {}
  else if _(config).isString() && config.indexOf("<%=") > -1
    _(config).template()(data)
  else
    config
