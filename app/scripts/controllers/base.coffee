Views.Header = require '../views/header'

class Controllers.Base

  beforeAction: ->
    view = new Views.Header
    App.getView().getRegion('headerRegion').show(view)
    App.getView().getRegion('contentRegion').empty()

  afterAction: ->
    # implement

module.exports = Controllers.Base
