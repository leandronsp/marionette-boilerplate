class Controllers.App extends Controllers.Base

  index: ->
    view = new Views.Index
    _App.getView().getRegion('contentRegion').show(view)

module.exports = Controllers.App
