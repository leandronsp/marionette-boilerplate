import Marionette from 'backbone.marionette';
import _template from '../../templates/views/indexView.hbs';

export default class IndexView extends Marionette.View {
  template() {
    return _template;
  }
}
