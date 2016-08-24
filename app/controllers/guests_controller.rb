class GuestsController < ApplicationController
  require 'numbers_in_words'
  require 'numbers_in_words/duck_punch'
  respond_to :json

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @question }
    end
  end

  def update
    @question = Question.find(params[:id])
    status = check_answer

    respond_to do |format|
      if status == 'CORRECT'
        format.json { head :no_content, status: :updated }
      else
        format.json { render json: 'ERRORR', status: :unprocessable_entity }
      end
    end
  end

  def check_answer
    if params[:guest][:answer] == @question.answer
      return 'CORRECT'
    elsif check_guest_answer == @question.answer
      return 'CORRECT'
    end
    return 'INCORRECT'
  end

  def check_guest_answer
    if params[:guest][:answer].match(/^[[:alpha:]]+$/).nil?
      @guest_answer = Integer(params[:guest][:answer]).in_words
    else
      @guest_answer = params[:guest][:answer].in_numbers
    end
    @guest_answer
  end
end
