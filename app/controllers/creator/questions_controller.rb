class Creator::QuestionsController < ApplicationController
  before_action :authenticate_user!
  def edit
    @question = Question.find(params[:id])
  end
  def index
     @questions = Question.all
     respond_to do |format|
       format.html
       format.json
       begin 
       format.pdf {render template: 'creator/subtickets/reporte', pdf: 'Reporte'}
       rescue Exception => e
       end 
     end
   end
end
