window.$           = require 'jquery'
window._           = require 'underscore'
window.Backbone    = require 'backbone'
window.Marionette  = require 'backbone.marionette'
window.Handlebars  = require 'handlebars'

AppLayout = require './layouts/appLayout'
AppRouter = require './routers/appRouter'

class Application extends Marionette.Application
  region: '#app'

  onBeforeStart: ->
    new AppRouter

  onStart: ->
    @showView(new AppLayout())
    Backbone.history.start() if Backbone.history

window.App = new Application
window.App.start()
