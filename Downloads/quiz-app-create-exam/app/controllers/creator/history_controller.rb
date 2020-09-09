class Creator::HistoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @historys = Ticket.all.where(user_id: current_user.id)
  end

end