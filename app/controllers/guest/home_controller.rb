class Guest::HomeController < ApplicationController
  
  def index
    @categories = (Category.all.where(delete_at: nil))
  end
end