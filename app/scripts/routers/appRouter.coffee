BaseRouter    = require './baseRouter'
AppController = require '../controllers/appController'

class AppRouter extends BaseRouter
  initialize: ->
    @controller = new AppController

  appRoutes:
    '': 'index'

module.exports = AppRouter
