require '../../app/scripts/manifest'
require './factories'

window.lazy = (attr, block) ->
  beforeEach ->
    @[attr] = block.call(@)
  afterEach ->
    delete @[attr]
