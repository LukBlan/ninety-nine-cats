class UsersController < ApplicationController
  before_action :redirect_to_home, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to cats_url
    else
      render json: {message: user.errors.full_messages}
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
