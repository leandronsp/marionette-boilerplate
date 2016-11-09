class Layouts.App extends Marionette.View
  className: 'app-layout'
  template: require '../../templates/layouts/app.hbs'

  regions:
    'headerRegion' : '#header-region'
    'contentRegion': '#content-region'
    'footerRegion' : '#footer-region'

module.exports = Layouts.App
