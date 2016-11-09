window.Layouts = {}
window.Models  = {}
window.Collections = {}
window.Controllers = {}
window.Routers = {}
window.Views = {}

window.$           = require 'jquery'
window._           = require 'underscore'
window.Backbone    = require 'backbone'
window.Marionette  = require 'backbone.marionette'
window.Handlebars  = require 'handlebars'

Layouts.App = require './layouts/app'
RouterManager = require './routers/routerManager'

class Application extends Marionette.Application
  region: '#app'

  onBeforeStart: ->
    new RouterManager().setup()

  onStart: ->
    @showView(new Layouts.App())
    Backbone.history.start() if Backbone.history

window.App = new Application
window.App.start()
