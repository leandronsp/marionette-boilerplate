class Views.Empty extends Marionette.View
  className: 'no-results'
  template: require '../../templates/views/empty.hbs'

  serializeData: ->
    { message: @options.message }

module.exports = Views.Empty
