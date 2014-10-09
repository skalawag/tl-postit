class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)
    @category[:category].capitalize!

    if @category.save
      flash[:notice] = "Your new category has been created."
      redirect_to posts_path
    else
      render :new
    end
  end

  # Suppose I want to destroy a category?

  private

  def post_params
    params.require(:category).permit(:category)
  end
end
