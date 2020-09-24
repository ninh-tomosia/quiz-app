class Creator::QuestionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @question = Question.find(params[:code])
  end
  def create
    question = Question.find(params[:question_id])
    question.update_columns(question: params[:question])
    question.answers.each do |ans|
      ans.update_columns(option_value: params["#{ans.id}"])
    end
    redirect_to ticket_path(question.ticket_id)
  end

  def destroy
    question = Question.find(params[:code])
    question.update_columns(delete_at: Time.now)
    redirect_to ticket_path(question.ticket_id)
  end
end