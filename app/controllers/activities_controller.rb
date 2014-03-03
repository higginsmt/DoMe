class ActivitiesController < ApplicationController

  def home
    activities = Activity.all
    @activity = activities[0] # activities[rand(0..activities.length)]
  end

  def about
  end

  def new
    @activity = Activity.new
  end



end
