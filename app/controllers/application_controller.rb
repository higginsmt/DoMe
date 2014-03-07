class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end


  def after_sign_in_path_for(resource)
    if session[:activity_params].present?
      session[:activity_params][:user_id] = current_user.id
      @activity = Activity.new(session[:activity_params])
       if !@activity.save
        flash[:error] = @activity.errors.full_messages.join(", ")
        new_activity_path(@activity)
      else
        activity_path(@activity)
      end
    elsif session[:activity_id].present?
      @adventure = Adventure.new(user_id: current_user.id, activity_id: session[:activity_id])
      @adventure.save
      flash[:success] = "Congratulations! You did it! :)"
      @activity = Activity.find(session[:activity_id])
      adventure_stories_path(@activity)
    else
      # session[:previous_url] || root_path
      root_path
    end
  end
end
