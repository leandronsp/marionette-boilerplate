import { App } from '../app';
import BaseController from './baseController';
import IndexView from '../views/indexView';

export default class AppController extends BaseController {

  index() {
    var view = new IndexView();
    App.layout.getRegion('contentRegion').show(view);
  }
}
