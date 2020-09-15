class Creator::QuestionsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @question = Question.find(params[:id])
  end
end