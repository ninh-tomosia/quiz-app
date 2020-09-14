class Guest::HistoryController < ApplicationController
  before_action :authenticate_user!

  def index 
    @histories = UserTicket.where(user_id: current_user.id, delete_at: nil).all
  end

end