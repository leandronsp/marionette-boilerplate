require '../app/scripts/manifest'

Collections.Users.prototype.fetch = (options = {}) ->
  response = [{
    name: 'Leandro Freitas'
  }]

  @reset response

  if options.success
    options.success @, {}, {}

require '../app/scripts/app'
