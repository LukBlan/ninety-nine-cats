class SessionsController < ApplicationController
  before_action :redirect_to_home, only: [:new, :create]

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user
      login(user)
      redirect_to cats_url
    else
      redirect_to new_session_path
    end

  end

  def destroy
    logout
    redirect_to cats_url
  end

  def new
    render :new
  end

  private
  def session_params
    params.require(:user).permit(:password, :username)
  end
end
