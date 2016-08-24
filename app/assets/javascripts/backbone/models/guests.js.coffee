@Dashboard.module "GuestsApp.Models", (Models, Dashboard, Backbone, Marionette, $, _) ->

  class Models.Guest extends Backbone.Model
    urlRoot: '/guests'
    answer: null

    url: ->
      baseUrl = @urlRoot
      return baseUrl if @isNew()
      "#{baseUrl}/#{@id}"

@Dashboard.module "GuestsApp.Collection", (Collection, Dashboard, Backbone, Marionette, $, _) ->

  class Collection.GuestsA extends Backbone.Collection
    model: Dashboard.GuestsApp.Models.Guest
    url: '/guests'
