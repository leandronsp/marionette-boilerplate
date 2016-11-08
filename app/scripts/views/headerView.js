import Marionette from 'backbone.marionette';
import _template from '../../templates/views/headerView.hbs';

export default class HeaderView extends Marionette.View {
  template() {
    return _template;
  }
}
