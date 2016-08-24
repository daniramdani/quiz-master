class QuestionsController < ApplicationController
  respond_to :json

  def index
    @questions = Question.order('id DESC')
    respond_with @questions.to_json(:only => [:id, :description, :answer], root: false)
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def new
    @question = Question.new

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content, status: :updated }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to admin_questions_url }
      format.json { head :no_content, status: :deleted }
    end
  end

end
