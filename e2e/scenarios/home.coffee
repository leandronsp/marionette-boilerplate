describe 'Scenarios', ->
  it 'renders the app name on Header', ->
    browser.driver.ignoreSynchronization = true

    browser.driver.get 'http://localhost:9000/'

    header = browser.driver.findElement By.id('header-region')
    expect(header.getText()).toEqual('Dummy App')

    content = browser.driver.findElement By.id('content-region')
    users = content.findElement By.tagName('ul')
    expect(users.getText()).toMatch('Leandro Freitas')
