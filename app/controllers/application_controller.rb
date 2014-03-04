class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if session[:activity_params].present?
      session[:activity_params][:user_id] = current_user.id
      @activity = Activity.new(session[:activity_params])
      @activity.save
      activity_path(@activity)
    else
      session[:previous_url] || root_path
    end
  end
end
