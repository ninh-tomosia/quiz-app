class Guest::HomeController < ApplicationController
  
  def index
    if current_user != nil
      redirect_to user_path(current_user) unless current_user.user_type.empty?
    end
    @categories = (Category.all.where(delete_at: nil))
  end

  def show
    @tickets = Category.find(params[:id]).tickets.where(delete_at: nil)
  end
end