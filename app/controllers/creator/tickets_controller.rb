class Creator::TicketsController < ApplicationController
  def index
    @tickets = Ticket.where(user_id: current_user.id, delete_at: nil)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    begin  
      ticket = Ticket.new(ticket_params)
      ticket.user_id = current_user.id
      if ticket.save
        if get_file[:file]
          data = read_file(get_file[:file])

          data.each do |item|
            ques        = item[:question]
            ans_correct = item[:correct]
            answers     = item[:answer]
            question    = Question.new #(:question ques, :answer ans_correct, :ticket_id ticket.id)
            question.question  = ques
            question.answer    = ans_correct
            question.ticket_id = ticket.id
            if question.save
              answer = Answer.new #(:option_value answers, :question_id question.id)
              answer.option_value = answers
              answer.question_id  = question.id
              answer.save
            end
          end
          redirect_to tickets_path

        end
      else
        redirect_to new_ticket_path
      end
    rescue => exception
      redirect_to new_ticket_path
    end
  end

  def show
    @tickets = Ticket.find(params[:id]).questions
  end

  def edit 
    @ticket = Ticket.find(params[:id])
  end

  def update
    ticket = Ticket.find(params[:id])
    if ticket.update(ticket_params)
      @tickets = Ticket.where(user_id: current_user.id, delete_at: nil)
      render :index
    else
      @ticket = Ticket.find(params[:id])
      render :edit
    end
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.delete_at = Time.now
    ticket.save
    @tickets = Ticket.where(user_id: current_user.id, delete_at: nil)
    render :index
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name_ticket, :category_id, :code_quiz, :time_quiz, :date_start, :date_finish)
  end

  def get_file
    params.require(:ticket).permit(:file)
  end

  def read_file(file)
    data = ""
    File.foreach(file).with_index do |line, i| 
        next if line == "\n"
        data += line.delete("\u007F") + " "
    end
    sub_data = []
    (data.split(/[Q]\s\d+[\.\:\?\/\)]/)).each do |item|
      next if item == ""
      sub_data.push(item.strip)
    end
    array_data = []
    index = 0
    sub_data.each do |item|
      array_data[index] = {}
      i = 0
      if item.index(")") != nil
        i = item.index(")")
      else
        i = item.index("?")
      end
      ques = item.slice(0, i + 1)
      ans  = item.slice(i + 2, item.length)

      ans_data = ans.split("\n")
      ans_option = []
      ans_correct = []
      ans_data.each do |ans|
        ans_option.push(ans.delete('!T').slice(3, ans.delete('!T').length).strip)
        if ans.index("!T") != nil
          ans_correct.push(ans.delete("!T").slice(3,  ans.delete('!T').length).strip)
        end
      end
      array_data[index][:question] = ques
      array_data[index][:answer]   = ans_option
      array_data[index][:correct]  = ans_correct
      index += 1
    end
    array_data
  end
end