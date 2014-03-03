class ActivitiesController < ApplicationController

  def home
    @activities = Activity.all
    @activity = @activities[0]
    respond_to do |format|
      format.html
      format.json { render json: @activities }
      # binding.pry
    end
  end

  def about
  end

end