import Marionette from 'backbone.marionette';

export default class BaseRouter extends Marionette.AppRouter {

  // Override `execute` function in order to call before/afterAction
  execute(callback, args) {
    this.controller.beforeAction();

    // call parent
    super.execute(callback, args);

    this.controller.afterAction();
  }
}
