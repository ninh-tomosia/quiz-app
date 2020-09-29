class Guest::ExamController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user != nil
      redirect_to user_path(current_user) unless current_user.user_type.empty?
    end
    @categories = Category.where(delete_at: nil)
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
      @categories = Category.where(delete_at: nil)
      flash[:alert] = "It's not time to do homework"
      redirect_to exam_index_path
    else
      if ticket.date_start.strftime("%d/%m/%Y") < DateTime.now.strftime("%d/%m/%Y") && ticket.date_finish.strftime("%d/%m/%Y") < DateTime.now.strftime("%d/%m/%Y")
        @categories = Category.where(delete_at: nil)
        flash[:alert] = "Time to do homework"
        redirect_to exam_index_path
      else
        if ticket.user_tickets.where(user_id: current_user.id, delete_at: nil).count > 0
          @categories = Category.where(delete_at: nil)
          flash[:alert] = "You have already done this post"
          redirect_to exam_index_path
        else
          @ticket = Ticket.new
          @ticket.id = ticket.id
          flash[:alert] = ""
        end
      end
    end
  end

  def update
    if session[:user_ticket] != nil
      ans = Answer.find(params[:id])
      history = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id).first
      if historys.nil?
        his = History.new
        his.user_ticket_id = session[:user_ticket]
        his.question_id = ans.question_id
        his.answer_id = params[:id]
        his.checked = correct
        his.save
      else
        history.update_columns(answer_id: params[:id])
      end
    end
  end

  def answer
    if session[:user_ticket] != nil
      ans = Answer.find(params[:id])
      correct = false
      if ans.is_correct?
        correct = true
      end
      history = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id).first
      if history.nil?
        his = History.new
        his.user_ticket_id = session[:user_ticket]
        his.question_id = ans.question_id
        his.answer_id = params[:id]
        his.checked = correct
        his.save
      else
        history.update_columns(answer_id: params[:id], checked: correct)
      end
    end
  end

  def handle_example
    if session[:user_ticket].present?
      score = History.where(user_ticket_id: session[:user_ticket], checked: true).size
      history = UserTicket.find(session[:user_ticket])
      total = (score * 100 / params[:count].to_f).round(2)
      time_complete = ((params[:time_quiz].to_i * 1000 * 60 + 2000) - params[:time_comple].to_i)
      history.update_columns(time_complete: time_complete, total_score: total)
      session[:user_ticket] = nil
      redirect_to paticipant_history_path
    else
      redirect_to paticipant_history_path
    end
  end
end
