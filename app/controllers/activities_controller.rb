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
    # binding.pry
  end

  def new
    @activity = Activity.new
  end

  def create
    if current_user.nil?
      session[:activity_params] = activity_params
      redirect_to new_user_session_path
    else
      @activity = Activity.new(activity_params)
      # current_user.created_activities << @activity
      if !@activity.save
        flash[:error] = @activity.errors.full_messages.join(", ")
        render :new
      else
        redirect_to activity_path(@activity)
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params[:activity][:user_id] = if current_user.present?
      current_user.id
    else
      nil
    end
    params.require(:activity).permit(:name, :blurb, :url, :things_needed, :user_id)
  end

end
