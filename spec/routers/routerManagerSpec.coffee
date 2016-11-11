describe RouterManager, ->
  lazy 'manager', -> new RouterManager

  describe '#setup', ->
    it 'setups routers', ->
      spyOn @manager.routers, 'push'
      @manager.setup()

      expect(@manager.routers.push.calls.count()).toEqual(1)
      expect(@manager.routers.push).toHaveBeenCalledWith(jasmine.any(Routers.Users))
