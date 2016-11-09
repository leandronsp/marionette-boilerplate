HeaderView  = require '../views/headerView'

class BaseController

  beforeAction: ->
    view = new HeaderView
    App.getView().getRegion('headerRegion').show(view)
    App.getView().getRegion('contentRegion').empty()

  afterAction: ->
    # implement

module.exports = BaseController
