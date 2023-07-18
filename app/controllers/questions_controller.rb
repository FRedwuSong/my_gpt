class QuestionsController < ApplicationController
  def index; end

  def create
    @answer = AnswerQuestion.new(question).call
  end

  private

  def question
    params[:question][:question]
  end
end
