IndexView      = require '../views/indexView'
BaseController = require './baseController'

class AppController extends BaseController

  index: ->
    view = new IndexView
    App.getView().getRegion('contentRegion').show(view)

module.exports = AppController
