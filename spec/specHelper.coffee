require '../app/scripts/manifest'

window.lazy = (attr, block) ->
  beforeEach ->
    @[attr] = block.call(@)
  afterEach ->
    delete @[attr]
