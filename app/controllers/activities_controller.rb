class ActivitiesController < ApplicationController

  def home
    activities = Activity.all
    @activity = activities[0]
    # binding.pry
  end

  def about
  end

end