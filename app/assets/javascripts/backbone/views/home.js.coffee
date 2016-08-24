@Dashboard.module "HomeApp.Views", (Views, Dashboard, Backbone, Marionette, $, _) ->
  class Views.HomeView extends Backbone.Marionette.CompositeView
    template: JST["backbone/templates/home/index"]
