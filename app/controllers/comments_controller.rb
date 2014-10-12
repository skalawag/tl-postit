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
end
