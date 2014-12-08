Filter = require('broccoli-filter')

module.exports = ServerSideTemplateFilter = (inputTree, options) ->
  if this instanceof ServerSideTemplateFilter
    @inputTree = inputTree
    @extensions = options.extensions
    @compileFunction = options.compileFunction
    @context = options.context
    return undefined
  else
    new ServerSideTemplateFilter(inputTree, options)


ServerSideTemplateFilter.prototype = Object.create(Filter.prototype)
ServerSideTemplateFilter::constructor = ServerSideTemplateFilter

ServerSideTemplateFilter::targetExtension = 'html'

ServerSideTemplateFilter::processString = (string) ->
  @compileFunction(string)(@context)
