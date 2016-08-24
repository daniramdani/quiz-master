@Dashboard.module 'QuestionsApp', (QuestionsApp, Dashboard, Backbone, Marionette, $, _) ->
  class QuestionsApp.QuestionsController extends Marionette.Controller
    index: ->
      questions = new Dashboard.QuestionsApp.Collection.Questions
      questions.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showQuestions questions
      Dashboard.contentRegion.show @layout

    show: (questionId) ->
      question = new Dashboard.QuestionsApp.Models.Question {id: parseInt(questionId)}
      question.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showQuestion question
      Dashboard.contentRegion.show @layout

    edit: (questionId) ->
      question = new Dashboard.QuestionsApp.Models.Question {id: parseInt(questionId)}
      question.fetch()
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showEditQuestion question
      Dashboard.contentRegion.show @layout

    new: ->
      question = new Dashboard.QuestionsApp.Models.Question
      @layout = @getLayoutView()
      @layout.on 'show', =>
        @showNewQuestion question
      Dashboard.contentRegion.show @layout

    getLayoutView: ->
      new Dashboard.QuestionsApp.Views.QuestionsLayout

    showNewQuestion: (question) ->
      questionNewView = @getNewQuestionView question
      @layout.questionsRegion.show questionNewView

    getNewQuestionView: (question) ->
      new Dashboard.QuestionsApp.Views.QuestionNewView
        model: question

    showQuestion: (question) ->
      questionsView = @getQuestionView question
      @layout.questionsRegion.show questionsView

    getQuestionView: (question) ->
      new Dashboard.QuestionsApp.Views.QuestionShowView
        model: question

    showEditQuestion: (question) ->
      questionsView = @getQuestionEditView question
      @layout.questionsRegion.show questionsView

    getQuestionEditView: (question) ->
      new Dashboard.QuestionsApp.Views.QuestionEditView
        model: question

    showQuestions: (questions) ->
      questionsView = @getQuestionsView questions
      @layout.questionsRegion.show questionsView

    getQuestionsView: (questions) ->
      new Dashboard.QuestionsApp.Views.QuestionsView
        collection: questions

