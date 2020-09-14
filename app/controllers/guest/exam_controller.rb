class Guest::ExamController < ApplicationController

  before_action :authenticate_user!
  
    respond_to :html, :json, :js 
      def index
      @ticket = Ticket.find(params[:code]).user_ticket.last
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
  
    def update
      # binding.pry
      if session[:user_ticket] != nil
        ans = Answer.find(params[:id])
        historys = History.where(user_ticket_id: session[:user_ticket], question_id: ans.question_id, answer_id: params[:id]).first
        # binding.pry
        if historys == nil
          his = History.new
          his.user_ticket_id = session[:user_ticket]
          his.question_id = ans.question_id
          his.answer_id = params[:id]
          his.checked = true
          # binding.pry
          his.save
        else
          # binding.pry
          if historys.checked == true
            historys.update_columns(checked: false)
          else
            historys.update_columns(checked: true)
          end
        end
        # binding.pry
      end
    end
  
  end