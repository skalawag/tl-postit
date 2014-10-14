class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    if not current_user
      flash[:error] = "You must log in or register to create a new post."
      redirect_to posts_path
    else
      @post = Post.new
    end
  end

  def vote
    post = Post.find_by id: params[:id]
    vote = Vote.create(user_id: current_user.id, vote: params[:vote], votable: post)

    if vote.valid?
      flash[:notice] = "Your vote has been counted."
    else
      flash[:notice] = "You cannot vote twice on one post."
    end

    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    if not current_user
      flash[:error] = "You must be the author of a post and logged in to edit it."
      redirect_to post_path
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated."
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
      end

  def set_post
    @post = Post.find(params[:id])
  end
end
