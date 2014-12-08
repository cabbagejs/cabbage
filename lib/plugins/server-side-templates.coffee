Filter = require('broccoli-filter')

module.exports = class ServerSideTemplateFilter extends Filter
  targetExtension: 'html'

  constructor: (inputTree, options) ->
    return new ServerSideTemplateFilter(inputTree, options) unless this instanceof ServerSideTemplateFilter
    @inputTree = inputTree
    @extensions = options.extensions
    @compileFunction = options.compileFunction
    @context = options.context

  processString: (string) ->
    @compileFunction(string)(@context)
