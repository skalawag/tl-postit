class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category[:category].capitalize!

    if @category.save
      flash[:notice] = "Your new category has been created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @category = Category.find_by slug: params[:id]
  end

  private

  def category_params
    params.require(:category).permit(:category)
  end
end
