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
    comment = Comment.find_by id: params[:id]
    if current_user
      if user_hasnt_voted(comment)
        vote = Vote.create(user_id: current_user.id, vote: params[:vote], votable: comment)
        redirect_to post_path(comment.post.id)
      else
        flash[:error] = "You cannot vote twice on one comment!"
        redirect_to post_path(comment.post.id)
      end
    else
      flash[:error] = "You must be logged in to vote."
      redirect_to post_path(comment.post.id)
    end
  end
end
