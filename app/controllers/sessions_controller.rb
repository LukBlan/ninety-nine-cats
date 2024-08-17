class SessionsController < ApplicationController
  before_action :redirect_to_home, only: [:new, :create]

  def create
    p session_params
  end

  def new
    render :new
  end

  private
  def session_params
    params.require(:user).permit(:password, :username)
  end
end
