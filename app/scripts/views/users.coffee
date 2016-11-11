class Views.Users.User extends Marionette.View
  tagName: 'li'
  template: require '../../templates/views/users/user.hbs'

class Views.Users.List extends Marionette.CollectionView
  tagName: 'ul'
  childView: Views.Users.User

module.exports = Views.Users
