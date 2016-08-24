@Dashboard.module "HomeApp", (HomeApp, Dashboard, Backbone, Marionette, $, _) ->

  class HomeApp.Router extends Marionette.AppRouter
      appRoutes:
        '': 'index'

    Dashboard.addInitializer ->
      window.homeRouter = new HomeApp.Router
        controller: new HomeApp.HomeController
