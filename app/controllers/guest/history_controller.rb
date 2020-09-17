class Guest::HistoryController < ApplicationController
  before_action :authenticate_user!

  def index 
    @pagy,@histories = pagy(UserTicket.where(user_id: current_user.id, delete_at: nil).all, items: 10)
  end

end