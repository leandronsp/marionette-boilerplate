class RouterManager
  constructor: ->
    @routers = []

  setup: ->
    @routers.push new Routers.App

module.exports = RouterManager
