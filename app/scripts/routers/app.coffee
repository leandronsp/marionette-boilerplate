Routers.Base    = require './base'
Controllers.App = require '../controllers/app'

class Routers.App extends Routers.Base
  initialize: ->
    @controller = new Controllers.App

  appRoutes:
    '': 'index'

module.exports = Routers.App
