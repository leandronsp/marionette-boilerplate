class AppLayout extends Marionette.View
  className: 'appLayout'
  template: require '../../templates/layouts/appLayout.hbs'

  regions:
    'headerRegion' : '#header-region'
    'contentRegion': '#content-region'
    'footerRegion' : '#footer-region'

module.exports = AppLayout
