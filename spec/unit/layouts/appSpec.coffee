describe Layouts.App, ->
  lazy 'view', -> new Layouts.App

  it 'renders the default regions', ->
    @view.render()
    expect(@view.$el.find('#header-region')).toExist()
    expect(@view.$el.find('#content-region')).toExist()
    expect(@view.$el.find('#footer-region')).toExist()
