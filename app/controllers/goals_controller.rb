class GoalsController < ApplicationController

  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def goal_params
    params.require(:goal).permit(:description, :state, :user_id)
  end
end
