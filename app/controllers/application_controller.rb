class ApplicationController < ActionController::Base
  before_action :check_session_timeout
  before_action :current_user
  before_action :check_session

  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])

    if @current_user.nil? && cookies.encrypted[:user_id]
      @current_user = User.find_by(id: cookies.encrypted[:user_id])
      session[:user_id] = @current_user.id
    end

    @current_user
  end

  def check_session_timeout
    if session[:user_id] && (Time.now - DateTime.parse(session[:created_at]) > 5.minutes)
      session[:user_id] = nil
      cookies.encrypted[:user_id] = nil
      @current_user = nil

      flash[:notice] = "Your session has timed out. Please sign in again."

      redirect_to root_path
    end
  end

  def check_session
    if session[:user_id].nil? && cookies.encrypted[:user_id].nil? || @current_user.nil?
      flash[:notice] = "Please sign in to vote."
      redirect_to root_path
    end
  end
end
