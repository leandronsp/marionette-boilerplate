class Collections.Users extends Backbone.Collection
  model: Models.User

  urlRoot: ->
    Config.apiHost

  url: ->
    "#{@urlRoot()}/api/users"

module.exports = Collections.Users
