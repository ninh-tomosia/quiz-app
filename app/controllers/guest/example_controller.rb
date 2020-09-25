class Guest::ExampleController < ApplicationController

  before_action :authenticate_user!


  def index
    if current_user != nil
      redirect_to user_path(current_user) unless current_user.user_type.empty?
    end
    @ticket = Ticket.find(params[:code])
  end
  
  def show
    us_ticket = UserTicket.new
    us_ticket.user_id = current_user.id
    us_ticket.ticket_id = params[:id]
    if us_ticket.save
      session[:user_ticket] = us_ticket.id
      @questions = Ticket.find(params[:id]).questions.where(delete_at: nil).shuffle
    else
      redirect_to :index
    end
  end

  def get_data
    @data = UserTicket.find(session[:user_ticket]).histories
  end

end