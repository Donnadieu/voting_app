class SessionsController < ApplicationController
  skip_before_action :check_session_timeout
  skip_before_action :current_user
  skip_before_action :check_session

  def new
    if session[:user_id] || cookies.encrypted[:user_id]
      redirect_to new_vote_path
    end
  end

  def create
    user = User.find_or_create_by(email: params[:email], zip_code: params[:zip_code])
    session[:user_id] = user.id
    session[:created_at] = Time.now

    cookies.encrypted[:user_id] = { value: user.id, expires: 5.minutes.from_now }
    @current_user = user

    redirect_to new_vote_path
  end

  def destroy
    session[:user_id] = nil
    cookies.encrypted[:user_id] = nil
    redirect_to root_path
  end
end
