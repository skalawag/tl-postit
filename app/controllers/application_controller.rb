class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :total_votes

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def total_votes(votable)
    votes = votable.votes
    votes.select { |v| v if v.vote }.count - votes.select { |v| v if not v.vote }.count
  end

  def user_hasnt_voted(votable)
    votable.votes.each do |vote|
      if vote.user_id == current_user[:id]
        return false
      end
      true
    end
  end
end
