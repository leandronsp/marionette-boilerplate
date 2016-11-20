describe Views.Header, ->
  lazy 'view', -> new Views.Header

  it 'renders the app name', ->
    @view.render()
    expect(@view.$el.find('h1').text()).toEqual('Dummy App')
