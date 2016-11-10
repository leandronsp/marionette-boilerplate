require './manifest'

class Application extends Marionette.Application
  region: '#app'

  onBeforeStart: ->
    new RouterManager().setup()

  onStart: ->
    @showView new Layouts.App
    Backbone.history.start() if Backbone.history

window._App = new Application
window._App.start()
