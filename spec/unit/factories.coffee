window.Factory = {}

Factory.buildUser = (options = {}) =>
  new Models.User _.extend({
    id: 'user42'
    name: 'John Craig'
  }, options)
