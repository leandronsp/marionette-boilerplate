Views.Index      = require '../views/index'
Controllers.Base = require './base'

class Controllers.App extends Controllers.Base

  index: ->
    view = new Views.Index
    App.getView().getRegion('contentRegion').show(view)

module.exports = Controllers.App
