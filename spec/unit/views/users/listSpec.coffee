describe Views.Users.List, ->

  it 'renders the users', ->
    user_1 = Factory.buildUser id: '1', name: 'John Craig'
    user_2 = Factory.buildUser id: '2', name: 'Thomas Right'

    collection = new Collections.Users([user_1, user_2])
    view = new Views.Users.List collection: collection
    view.render()

    expect(view.$el.find('li').length).toEqual(2)

    first  = $(view.$el.find('li')[0])
    second = $(view.$el.find('li')[1])

    expect(first.find('.name').text()).toEqual('John Craig')
    expect(second.find('.name').text()).toEqual('Thomas Right')

  it 'shows `No users` on absence', ->
    collection = new Collections.Users
    view = new Views.Users.List collection: collection
    view.render()

    expect($(view.$el.find('.no-results')).text().trim()).toEqual('No users')
