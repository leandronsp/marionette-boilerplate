class Controllers.Base

  beforeAction: ->
    view = new Views.Header
    _App.getView().getRegion('headerRegion').show(view)
    _App.getView().getRegion('contentRegion').empty()

  afterAction: ->
    # implement

module.exports = Controllers.Base
