class Routers.Users extends Routers.Base
  initialize: ->
    @controller = new Controllers.Users

  appRoutes:
    '': 'index'

module.exports = Routers.Users
