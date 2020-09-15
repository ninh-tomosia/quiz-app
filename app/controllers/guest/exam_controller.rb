class Guest::ExamController < ApplicationController
  before_action :authenticate_user! 
  respond_to :html, :json, :js 
  
  def index
    @categories = Category.where(delete_at: nil).all
  end

  def show
    us_ticket = UserTicket.new
    us_ticket.user_id = current_user.id
    us_ticket.ticket_id = params[:id]
    if us_ticket.save
      session[:user_ticket] = us_ticket.id
      @questions = Ticket.find(params[:id]).questions.shuffle
    else
      redirect_to :index
    end
  end

  def create
    ticket = Ticket.find(params[:code])
    if ticket.code_quiz == params[:code_quiz]
      redirect_to exam_intro_path(code: ticket.id)
    else
      @ticket = Ticket.new
      @ticket.id = ticket.id
      flash[:notice] = "Your code is incorrect! Please, enter your code again."
      redirect_to exam_check_code_path(code: @ticket.id)
    end
  end

  def intro
    @ticket = Ticket.find(params[:code])
  end

  def check_code
    ticket = Ticket.find(params[:code])
    if ticket.date_start.strftime("%d/%m/%Y") > DateTime.now.strftime("%d/%m/%Y")
      @categories = Category.where(delete_at: nil).all
      flash[:alert] = "It's not time to do homework"
      redirect_to exam_index_path
    else
      if ticket.date_start.strftime("%d/%m/%Y") < DateTime.now.strftime("%d/%m/%Y") && ticket.date_finish.strftime("%d/%m/%Y") < DateTime.now.strftime("%d/%m/%Y")
        @categories = Category.where(delete_at: nil).all
        flash[:alert] = "Time to do homework"
        redirect_to exam_index_path
      else
        @ticket = Ticket.new
        @ticket.id = ticket.id
        flash[:alert] = ""
      end
    end
  end

  def update
    if session[:user_ticket] != nil
      ans = Answer.find(params[:id])
      historys = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id, answer_id: params[:id]).first
      if historys == nil
        his = History.new
        his.user_ticket_id = session[:user_ticket]
        his.question_id = ans.question_id
        his.answer_id = params[:id]
        his.checked = true
        his.save
      else
        if historys.checked == true
          historys.update_columns(checked: false)
        else
          historys.update_columns(checked: true)
        end
      end
    end
  end

  def answer
    if session[:user_ticket] != nil
      ans = Answer.find(params[:id])
      historys = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id, answer_id: params[:id]).first
      if historys == nil
        histories = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id).all
        histories.each do |history|
          history.update_columns(checked: false)
        end
        binding.pry
        his = History.new
        his.user_ticket_id = session[:user_ticket]
        his.question_id = ans.question_id
        his.answer_id = params[:id]
        his.checked = true
        his.save
        
      else
        histories = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id).all
        histories.each do |history|
          history.update_columns(checked: false)
        end
        historys.update_columns(checked: true)
      end
    end
  end

end