@Dashboard.module "QuestionsApp.Views", (Views, Dashboard, Backbone, Marionette, $, _) ->
  class Views.QuestionItemView extends Backbone.Marionette.ItemView
    tagName: 'tr'
    template: JST["backbone/templates/questions/question"]
    initialize: -> @model.on 'sync', @render, @

    events:
      'click .destroy': 'destroy'

    destroy: ->
      if confirm 'Delete Question ?'
        @model.destroy()
        this.remove()
      0

  class Views.QuestionShowView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/questions/show"]
    initialize: -> @model.on 'sync', @render, @

  class Views.QuestionEditView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/questions/edit"]
    initialize: -> @model.on 'sync', @render, @
    events:
      "submit #edit-question" : "update"
    update: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.set  Backbone.Syphon.serialize @

      @model.save null,
        success : (question) =>
          @model = question
          window.location.hash = "#/questions/#{@model.id}"

  class Views.QuestionNewView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/questions/new"]
    onDomRefresh: ->
      $('#desk').wysiwyg()
      $('#desk').cleanHtml()

    events:
      "submit #new-question" : "create"
    create: (e) ->
      e.preventDefault()
      @model.attributes.description = $("#desk").html()
      e.stopPropagation()
      @model.set Backbone.Syphon.serialize @
      @model.save null,
        success : (question) =>
          @model = question
          window.location.hash = "#/questions/#{@model.id}"

  class Views.NoQuestionsView extends Backbone.Marionette.ItemView
    template: JST["backbone/templates/questions/noquestions"]
    tagName: 'tr'

  class Views.QuestionsView extends Backbone.Marionette.CompositeView
    template: JST["backbone/templates/questions/index"]
    itemView: Views.QuestionItemView
    emptyView: Views.NoQuestionsView
    itemViewContainer: 'tbody'

  class Views.QuestionsLayout extends Backbone.Marionette.Layout
    template: JST["backbone/templates/questions/layout"]
    regions:
      questionsRegion: "#questions-region"
