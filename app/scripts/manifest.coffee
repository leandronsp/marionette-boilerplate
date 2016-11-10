require './vendor'
require './ns'

window.Layouts.App   = require './layouts/app'

window.RouterManager = require './routers/routerManager'
window.Routers.Base  = require './routers/base'
window.Routers.App   = require './routers/app'

window.Controllers.Base  = require './controllers/base'
window.Controllers.App   = require './controllers/app'

window.Views.Header = require './views/header'
window.Views.Index  = require './views/index'
