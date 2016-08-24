@Dashboard.module "QuestionsApp", (QuestionsApp, Dashboard, Backbone, Marionette, $, _) ->

  class QuestionsApp.Router extends Marionette.AppRouter
      appRoutes:
        'questions': 'index'
        'questions/new': 'new'
        'questions/:id': 'show'
        'questions/:id/edit': 'edit'

    Dashboard.addInitializer ->
      window.questionsRouter = new QuestionsApp.Router
        controller: new QuestionsApp.QuestionsController
