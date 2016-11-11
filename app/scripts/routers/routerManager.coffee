class RouterManager
  constructor: ->
    @routers = []

  setup: ->
    @routers.push new Routers.Users

module.exports = RouterManager
