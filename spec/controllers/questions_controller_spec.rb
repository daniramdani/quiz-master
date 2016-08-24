require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "GET #index" do
    it "Populates list of Questions" do
      question = Question.create
      get :index
      expect(assigns(:questions)).to eq([question])
    end

    it "renders the :index view" do
      question = mock_model(Question, :save => true)
      Question.stub(:new).with({'description' => 'Hello.. ', 'Answer' => 'Hi.. '}) { question }
      post :create, :question => {'description' => 'Hello.. ', 'Answer' => 'Hi.. '}, :format => :json
      expect(response.body).to eq(question.to_json)
    end
  end
end
