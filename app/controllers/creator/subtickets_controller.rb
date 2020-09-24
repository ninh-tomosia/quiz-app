class Creator::SubticketsController < ApplicationController
  before_action :authenticate_user!
  respond_to :docx

  def index
     @subtickets = Ticket.find(params[:code]).subtickets.where(user_id: current_user.id, delete_at: nil)
     
     if @subtickets.empty?
      redirect_to tickets_path
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
    @subticket = Subticket.find(params[:id])
  end

  def destroy
    subticket = Subticket.find(params[:id])
    subticket.delete_at = Time.now
    subticket.save
    @subtickets = Subticket.where(user_id: current_user.id, delete_at: nil)
    render :index
  end

  def create
    for i in 0..(sub_params[:subticket_code].to_i) do
      break if i >= sub_params[:subticket_code].to_i
      code = random_sub_code
      subticket = Subticket.new
      subticket.ticket_id = sub_params[:ticket_id]
      subticket.user_id   = sub_params[:user_id]
      sub_content = []
      Ticket.find(sub_params[:ticket_id]).questions.shuffle.each do |question|
        data = []
        data.push(question.id)
        ans = []
        question.answers.shuffle.each do |answer|
          ans.push(answer.id)
        end
        data.push(ans)
        sub_content.push(data)
      end
      subticket.sub_content = sub_content
      subticket.subticket_code = code
      subticket.save
    end
    @subtickets = Subticket.all.where(ticket_id: sub_params[:ticket_id])
    render :index
  end

  def download 
    @subticket = Subticket.find(params[:code])
    respond_to do |format|
      format.docx do
        render docx: 'download', filename: "download-subticket-#{@subticket.subticket_code.to_s}.docx"
      end
    end
  end

  def download_answer
    @subticket = Subticket.find(params[:code])
    respond_to do |format|
      format.docx do
        render docx: 'download_answer_correct', filename: "download-answer-correct-subticket-#{@subticket.subticket_code.to_s}.docx"
      end
    end
  end

  private

  def sub_params
    params.require(:subticket).permit(:subticket_code, :ticket_id, :user_id)
  end

  def random_sub_code
    rand(100..999)
  end

end