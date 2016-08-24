@Dashboard.module 'HomeApp', (HomeApp, Dashboard, Backbone, Marionette, $, _) ->
  class HomeApp.HomeController extends Marionette.Controller
    index: ->
      @layout = @getHomeView()
      Dashboard.contentRegion.show @layout

    getHomeView: (questions) ->
      new Dashboard.HomeApp.Views.HomeView
        collection: questions
