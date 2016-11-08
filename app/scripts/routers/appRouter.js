import AppController from '../controllers/appController';
import BaseRouter from './baseRouter';

export default class AppRouter extends BaseRouter {
  initialize() {
    this.controller = new AppController();

    this.appRoutes = {
      '': 'index'
    };
  }
}
