class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:user_id, :lesson_id, :relationship_id)
  end
end
