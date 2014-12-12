merge = require('./../util/merge')

# This isn't a great name for what it does, but often we need to
# start with an input tree, filter it down, and then return a merge of both
# the original input tree as well as the filtered one.
# Examples:
# - export concatenated JS as well as a tree export
# - export concatenated CSS as well as the compiled Sass found in the same tree

module.exports = (inputTree, dupeFunction) ->
  merge(inputTree, dupeFunction(inputTree))
