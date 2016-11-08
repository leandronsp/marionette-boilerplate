import Marionette from 'backbone.marionette';
import _template from '../../templates/layouts/appLayout.hbs';

export default class AppLayout extends Marionette.View {
  template() {
    return _template;
  }

  regions() {
    return {
      'headerRegion': '#header-region',
      'contentRegion': '#content-region',
      'footerRegion': '#footer-region'
    };
  }
}
