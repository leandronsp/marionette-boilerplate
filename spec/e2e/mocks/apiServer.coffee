class ApiMock
  create: ->
    jsonServer  = require 'json-server'
    @server      = jsonServer.create()
    @router      = jsonServer.router('spec/e2e/mocks/api.json')

    middlewares = jsonServer.defaults()
    @server.use(middlewares)

    @server.use(jsonServer.rewriter({
      '/api/': '/',
    }))

    @instance = @server.listen 8001

  whenGET: (endpoint, data) ->
    @server.get endpoint, (request, response) ->
      response.locals = data
      response.jsonp(response.locals)
      next()

    @server.use(@router)

  close: ->
    @instance.close()

module.exports = ApiMock
