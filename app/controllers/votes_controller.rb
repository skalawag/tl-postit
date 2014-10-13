class VotesController < ApplicationController

  def post_vote
    post = Post.find_by id: params[:id]
    if current_user
      vote = Vote.create(user_id: current_user.id, vote: params[:vote], votable: post)
    redirect_to :back
    else
      flash[:error] = "You must be logged in to vote."
      redirect_to :back
    end
  end

  def comment_vote
    comment = Comment.find_by id: params[:id]
    if current_user
      vote = Vote.create(user_id: current_user.id, vote: params[:vote], votable: comment)
    redirect_to :back
    else
      flash[:error] = "You must be logged in to vote."
      redirect_to :back
    end
  end
end
