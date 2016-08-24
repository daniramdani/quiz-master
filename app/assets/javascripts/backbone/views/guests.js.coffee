@Dashboard.module "GuestsApp.Views", (Views, Dashboard, Backbone, Marionette, $, _) ->
  class Views.GuestItemView extends Backbone.Marionette.ItemView
    tagName: 'tr'
    template: JST["backbone/templates/guests/guest"]
    initialize: -> @model.on 'sync', @render, @

    events:
      'click .destroy': 'destroy'

    destroy: ->
      if confirm 'Delete Guest ?'
        @model.destroy()
        this.remove()
      0

  class Views.GuestShowView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/guests/show"]
    initialize: -> @model.on 'sync', @render, @
    events:
      "submit #answer-question" : "update"
    update: (e) ->
      e.preventDefault()
      e.stopPropagation()
      @model.set  Backbone.Syphon.serialize @
      @model.save null,
        success : (question) =>
          alert('Your Answer is Correct !!')
        error : (question) =>
          alert('Incorrect !! Please Try Another Answer..')

  class Views.NoGuestsView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/guests/noguests"]
    tagName: 'tr'

  class Views.GuestsView extends Backbone.Marionette.CompositeView
    template: JST["backbone/templates/guests/index"]
    itemView: Views.GuestItemView
    emptyView: Views.NoGuestsView
    itemViewContainer: 'tbody'

  class Views.GuestsLayout extends Backbone.Marionette.Layout
    template: JST["backbone/templates/guests/layout"]
    regions:
      guestsRegion: "#guests-region"
