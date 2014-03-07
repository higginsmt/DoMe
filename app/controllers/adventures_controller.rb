class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new # if logged in
    @adventure = Adventure.new(user_id: current_user.id, activity_id: params[:activity_id])
    @adventure.save
    render json: @adventure # because this action started in ajax, it automatically goes back to ajax, and the redirect must be done from there
    flash[:success] = "Congratulations! You did it! :)"
  end

  def update # show page for adventure with empty story form
    @adventure = Adventure.where(user_id: current_user.id, activity_id: params[:id]).first # the .first is if "did" the activity more than once
    @activity = Activity.find(params[:id])
    all_adventures = Adventure.where(activity_id: params[:id]).order(updated_at: :desc)
    @stories = all_adventures.map do |adventure|
      adventure[:story]
    end
  end

  def new_after_login
    session[:activity_id] = params[:id]
    flash[:notice] = "You need to sign in to save your adventure :)"
    redirect_to new_user_session_path
  end

  def create_story
    @adventure = Adventure.find(params[:adventure_id])
    @activity = Activity.find(params[:activity_id])
    story_body = params[:story_body]
    @adventure.update_attributes(story: story_body)
    render json: @adventure # this now becomes "data" in javascript-land
  end

end
