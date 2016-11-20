ApiMock = require './mocks/apiServer'

describe 'Home', ->
  beforeEach ->
    @apiMock = new ApiMock
    @apiMock.create()

  afterEach ->
    @apiMock.close()

  it 'renders users', ->
    @apiMock.whenGET '/users', [
      { name: 'User 1' },
      { name: 'User 2' }
    ]

    browser.driver.get 'http://localhost:9000/'

    content = browser.driver.findElement By.id('content-region')
    users = content.findElement(By.tagName('ul'))

    users.findElements(By.tagName('li')).then (elements) ->
      expect(elements.length).toEqual(2)

  it 'shows message `No users` on absence', ->
    @apiMock.whenGET '/users', []

    browser.driver.get 'http://localhost:9000/'

    content = browser.driver.findElement By.id('content-region')

    content.findElement(By.className('no-results')).then (element) ->
      expect(element.getText()).toEqual('No users')

    users = content.findElement(By.tagName('ul'))

    users.findElements(By.tagName('li')).then (elements) ->
      expect(elements.length).toEqual(0)
