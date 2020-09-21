class Guest::HomeController < ApplicationController
  
  def index
    if current_user != nil
      redirect_to user_path(current_user) unless current_user.user_type.empty?
    end
    @pagy, @categories = pagy(Category.all.where(delete_at: nil), items: 5)
  end

  def show
    @tickets = Category.find(params[:id]).tickets.where(delete_at: nil)
  end
end