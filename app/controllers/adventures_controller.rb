class AdventuresController < ApplicationController

  def index
  end

  def new
    @adventure = Adventure.new(user_id: current_user.id, activity_id: params[:activity_id])
    @adventure.save
    render json: @adventure # because this action started in ajax, it automatically goes back to ajax, and the redirect must be done from there
  end

  def update # show page for adventure with empty story form
    @adventure = Adventure.where(user_id: current_user.id, activity_id: params[:id]).first # the .first is if "did" the activity more than once
    @activity = Activity.find(params[:id])
    all_adventures = Adventure.where(activity_id: params[:id]).all
    @stories = all_adventures.map do |adventure|
      adventure[:story]
    end
  end

  def create_story
    # @adventure =
  end

end
