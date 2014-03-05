class AdventuresController < ApplicationController

  def index
  end

  def new
    @adventure = Adventure.new(user_id: current_user.id, activity_id: params[:activity_id])
    @adventure.save
    render json: @adventure # what does this line do?
  end

  def update
  end

end
