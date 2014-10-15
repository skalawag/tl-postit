class CommentsController < ApplicationController

  def create
    if not logged_in?
      flash[:error] = "You must be logged in to leave a comment."
      redirect_to post_path(params[:post_id])
    else
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(params.require(:comment).permit(:body))
      ## prev line equivalent to:
      #@comment = Comment.new(params.require(:comment).permit(:body))
      #@comment.post = @post
      @comment.user_id = current_user.id
      if @comment.save
        flash[:notice] = "Your comment has been saved."
        redirect_to post_path(@post)
      else
        render '/posts/show'
      end
    end
  end

  def vote
    @comment = Comment.find_by id: params[:id]
    @vote = Vote.create(user_id: current_user.id, vote: params[:vote], votable: @comment)

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "Your vote has been counted."
        else
          flash[:notice] = "You cannot vote twice on a comment."
        end
        redirect_to post_path(@comment.post.id)
      end
      format.js
    end
  end
end
