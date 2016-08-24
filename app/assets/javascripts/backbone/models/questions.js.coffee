@Dashboard.module "QuestionsApp.Models", (Models, Dashboard, Backbone, Marionette, $, _) ->

  class Models.Question extends Backbone.Model
    urlRoot: '/questions'
    description: null
    answer: null

    validation:
      description:
        required: true,
      answer:
        required: true,
      someAttribute: ->
        if(value == '')
          return 'Error message'

    url: ->
      baseUrl = @urlRoot
      return baseUrl if @isNew()
      "#{baseUrl}/#{@id}"

@Dashboard.module "QuestionsApp.Collection", (Collection, Dashboard, Backbone, Marionette, $, _) ->

  class Collection.Questions extends Backbone.Collection
    model: Dashboard.QuestionsApp.Models.Question
    url: '/questions'
