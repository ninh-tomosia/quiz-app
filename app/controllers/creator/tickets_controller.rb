class Creator::TicketsController < ApplicationController
  def index
    @tickets = Ticket.where(user_id: current_user.id, delete_at: nil)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    read_file(get_file[:file])

    binding.pry
  end


  private

  def ticket_params
    params.require(:ticket).permit(:name_ticket, :category_id, :code_quiz, :time_quiz)
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