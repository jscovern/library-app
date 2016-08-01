module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    session[:login_time] = Time.now
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    if current_user == nil
      redirect_to "/sign_in"
    end
  end

  def logout
    @current_user = session[:user_id] = session[:login_time] = nil
  end
end
