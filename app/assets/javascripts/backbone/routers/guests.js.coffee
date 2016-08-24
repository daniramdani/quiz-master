@Dashboard.module "GuestsApp", (GuestsApp, Dashboard, Backbone, Marionette, $, _) ->

  class GuestsApp.Router extends Marionette.AppRouter
      appRoutes:
        'guests': 'index'
        'guests/:id': 'show'

    Dashboard.addInitializer ->
      window.guestsRouter = new GuestsApp.Router
        controller: new GuestsApp.GuestsController
