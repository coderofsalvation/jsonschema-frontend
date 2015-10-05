jsonref = require('json-ref-lite/index.coffee')()

o = {}

o.parse = (uimodel) ->
  jsonref.resolve uimodel

module.exports = o
