Backbone.Collection.prototype.fetch = (options = {}) ->
  if options.success
    options.success @, {}, {}
