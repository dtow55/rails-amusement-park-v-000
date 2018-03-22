module ApplicationHelper
  def navbar_logout
    if session[:user_id]
      link_to("Log Out", logout_path)
    end
  end

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    end
    nil
  end
end
