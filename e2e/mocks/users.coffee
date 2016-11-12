mock = [
  { name: 'John Craig' },
  { name: 'Thomas Johnson' }
]

Collections.Users.prototype.fetch = (options = {}) ->
  @reset mock
  super
