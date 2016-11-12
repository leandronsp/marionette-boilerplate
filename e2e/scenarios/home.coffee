describe 'Home', ->
  it 'renders the users', ->
    browser.driver.get 'http://localhost:9000/'

    content = browser.driver.findElement By.id('content-region')
    users = content.findElement(By.tagName('ul'))

    users.findElements(By.tagName('li')).then (elements) ->
      expect(elements.length).toEqual(2)
