class Routers.Base extends Marionette.AppRouter
  execute: (callback, args) ->
    @controller.beforeAction()
    super(callback, args)
    @controller.afterAction()

module.exports = Routers.Base
