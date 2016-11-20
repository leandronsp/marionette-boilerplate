describe 'Header', ->
  it 'renders the app name on Header', ->
    browser.driver.get 'http://localhost:9000/'

    header = browser.driver.findElement By.id('header-region')
    expect(header.getText()).toEqual('Dummy App')
