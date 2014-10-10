class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    ## prev line equivalent to:
    #@comment = Comment.new(params.require(:comment).permit(:body))
    #@comment.post = @post
    ## FIXME:
    @comment.user_id = 1
    if @comment.save
      flash[:notice] = "Your comment has been saved."
      redirect_to post_path(@post)
    else
      render '/posts/show'
    end
  end
end
