
class Creator::SubticketsController < ApplicationController
  before_action :authenticate_user!
  respond_to :docx

  def index
   # @subtickets = Ticket.find(params[:code]).subtickets
  
   @subtickets = Subticket.all
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
  
  def new
    ticket_id = Ticket.find(params[:code]).id
    @subticket = Subticket.new
    @subticket.ticket_id = ticket_id
    @subticket.user_id   = current_user.id
    @subticket
  end

  def show
   sub_ticket  = Subticket.find(params[:id])
    tickets = Ticket.find(sub_ticket[:ticket_id]).questions
    @subtickets = random_question(tickets)
    @subticket = Subticket.new
     
  end


  def create
    for i in 0..(sub_params[:subticket_code].to_i) do
      break if i >= sub_params[:subticket_code].to_i
      code = random_sub_code
      subticket = Subticket.new(sub_params)
      subticket.subticket_code = code
      subticket.save
      # binding.pry
    end
    @subtickets = Subticket.all.where(ticket_id: sub_params[:ticket_id])
    render :index
  end

  private
 
  def sub_params
    params.require(:subticket).permit(:subticket_code, :ticket_id, :user_id)
  end

  def random_sub_code
    rand(100..999)
  end

  def random_question(ques)
    ques.shuffle
  end

  def random_answer(ans)
    ans.shuffle
  end


end