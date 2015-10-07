jsonref  = require('json-ref-lite/index.coffee')()
mustache = require 'mustache'
fs       = require 'fs'

o = {}

o.parse = (uimodel) ->
  jsonref.resolve uimodel

o.register_mustache_filters = (data) ->
  data.foo = () ->
    return (text,render) ->
      return ""+render(text)+""

o.render = ( tplfile, data, jscode ) ->
  @.register_mustache_filters data
  tpl = fs.readFileSync( tplfile ).toString()
  jscode.push mustache.render tpl, data

module.exports = o
