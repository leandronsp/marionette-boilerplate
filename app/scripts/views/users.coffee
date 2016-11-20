class Views.Users.User extends Marionette.View
  tagName: 'li'
  template: require '../../templates/views/users/user.hbs'

class Views.Users.List extends Marionette.CollectionView
  tagName: 'ul'
  childView: Views.Users.User
  emptyView: Views.Empty

  emptyViewOptions: ->
    message: 'No users'

module.exports = Views.Users
