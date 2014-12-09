Filter = require('broccoli-filter')
jsStringEscape = require('js-string-escape')

module.exports = class ClientSideTemplateFilter extends Filter
  targetExtension: 'js'

  constructor: (inputTree, options) ->
    return new ClientSideTemplateFilter(inputTree, options) unless this instanceof ClientSideTemplateFilter
    @inputTree = inputTree
    @extensions = options.extensions
    @compileFunction = options.compileFunction
    @namespace = options.namespace

  processString: (string, path) ->
    "JST=window.JST||{}; JST['#{path.replace("#{@namespace}/", '')}'] = #{@compileFunction(string).source};"
