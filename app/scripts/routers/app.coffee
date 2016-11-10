class Routers.App extends Routers.Base
  initialize: ->
    @controller = new Controllers.App

  appRoutes:
    '': 'index'

module.exports = Routers.App
