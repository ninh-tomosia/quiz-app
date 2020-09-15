class Creator::CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(user_id: current_user.id, delete_at: nil)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.user_id = current_user.id
    
    if category.save
      @categories = Category.where(user_id: current_user.id, delete_at: nil)
      render :index
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      @categories = Category.where(user_id: current_user.id, delete_at: nil)
      render :index
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.delete_at = Time.now
    if category.save
      @categories = Category.where(user_id: current_user.id, delete_at: nil)
      render :index
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name_category, :image)
  end
end