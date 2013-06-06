helpers do
  def current_user
    if session["user"]
      @current_user ||= User.find_by_id(session["user"])
    end
  end

  def current_user_id
    user = current_user
    user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def same_user?(user)
    cookied_user = current_user
    cookied_user.id == user.id
  end
end
