class ApplicationController < ActionController::Base
  helper_method :current_user, :user_own_cat

  def redirect_to_login
    redirect_to new_session_url if current_user.nil?
  end

  def redirect_to_home
    redirect_to cats_url if current_user
  end

  def login(user)
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout
    session[:session_token] = nil
    # @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def user_own_cat(id)
    user = current_user
    cats = user.cats.where(id: id)
    !cats.empty?
  end


  def redirect_on_not_owned_cat
    redirect_to cats_url unless user_own_cat(params[:id])
  end
end
