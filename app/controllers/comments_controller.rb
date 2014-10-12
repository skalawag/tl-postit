class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    ## prev line equivalent to:
    #@comment = Comment.new(params.require(:comment).permit(:body))
    #@comment.post = @post
    @comment.user_id = current_user
    if @comment.save
      flash[:notice] = "Your comment has been saved."
      redirect_to post_path(@post)
    else
      render '/posts/show'
    end
  end
end
