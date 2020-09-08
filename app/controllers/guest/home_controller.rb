class Guest::HomeController < ApplicationController
  
  def index
    @categories = (Category.all.where(delete_at: nil))
  end

  def show
    @tickets = Category.find(params[:id]).tickets.where(delete_at: nil)
  end
end