class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:show]


  def home
    @activities = Activity.all
    respond_to do |format|
      format.html
      format.json { render json: @activities }
      # binding.pry
    end
  end

  def about
  end

  def index
    @submitted = current_user.created_activities
  end

  def new
    @activity = Activity.new
  end

  def create
    if current_user.nil?
      session[:activity_params] = activity_params
      flash[:error] = "You need to sign in to continue - don't worry, we saved your submission :)"
      redirect_to new_user_session_path
    else
      @activity = Activity.new(activity_params)
      if !@activity.save
        flash.now[:error] = @activity.errors.full_messages.join(", ")
        render :new
      else
        flash[:success] = "Your activity has been submitted successfully!"
        redirect_to activity_path(@activity)
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    if current_user.present?
      params[:activity][:user_id] = current_user.id
    end
    params.require(:activity).permit(:name, :blurb, :url, :map_code, :things_needed, :user_id)
  end

end
