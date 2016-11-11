require './vendor'
require './ns'

window.Config = require './config.json'

window.Models.User = require './models/user'
window.Collections.Users = require './collections/users'

window.Layouts.App   = require './layouts/app'

window.RouterManager = require './routers/routerManager'
window.Routers.Base  = require './routers/base'
window.Routers.Users = require './routers/users'

window.Controllers.Base  = require './controllers/base'
window.Controllers.Users = require './controllers/users'

window.Views.Header = require './views/header'
window.Views.Users  = require './views/users'
