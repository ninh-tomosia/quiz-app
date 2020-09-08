class Guest::ExampleController < ApplicationController

  before_action :authenticate_user!

	def index
    @ticket = Ticket.find(params[:code])
  end
  
  def show
    # @pagy, @questions = pagy(Ticket.find(params[:id]).questions, items: 1)
    @questions = Ticket.find(params[:id]).questions.shuffle
  end

end