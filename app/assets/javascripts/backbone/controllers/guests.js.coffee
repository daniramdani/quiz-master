@Dashboard.module 'GuestsApp', (GuestsApp, Dashboard, Backbone, Marionette, $, _) ->
  class GuestsApp.GuestsController extends Marionette.Controller
    index: ->
      questions = new Dashboard.QuestionsApp.Collection.Questions
      questions.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showQuestions questions
      Dashboard.contentRegion.show @layout

    getLayoutView: ->
      new Dashboard.GuestsApp.Views.GuestsLayout

    showQuestions: (questions) ->
      questionsView = @getGuestsView questions
      @layout.guestsRegion.show questionsView

    getGuestsView: (questions) ->
      new Dashboard.GuestsApp.Views.GuestsView
        collection: questions

    show: (questionId) ->
      question = new Dashboard.GuestsApp.Models.Guest {id: parseInt(questionId)}
      question.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showQuestion question
      Dashboard.contentRegion.show @layout

    showQuestion: (question) ->
      questionView = @getGuestView question
      @layout.guestsRegion.show questionView

    getGuestView: (question) ->
      new Dashboard.GuestsApp.Views.GuestShowView
        model: question
