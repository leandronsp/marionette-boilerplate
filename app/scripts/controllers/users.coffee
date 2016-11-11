class Controllers.Users extends Controllers.Base

  index: ->
    collection = new Collections.Users

    collection.fetch success: ->
      view = new Views.Users.List collection: collection
      _App.getView().getRegion('contentRegion').show(view)

module.exports = Controllers.Users
