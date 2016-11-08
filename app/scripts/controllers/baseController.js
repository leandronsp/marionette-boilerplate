import { App } from '../app';
import HeaderView from '../views/headerView';

export default class BaseController {
  beforeAction() {
    var view = new HeaderView();
    App.layout.getRegion('headerRegion').show(view);
    App.layout.getRegion('contentRegion').empty();
  }

  afterAction() {
    //console.log('after action');
  }
}
