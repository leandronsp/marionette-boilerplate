class BaseRouter extends Marionette.AppRouter
  execute: (callback, args) ->
    @controller.beforeAction()
    super(callback, args)
    @controller.afterAction()

module.exports = BaseRouter
