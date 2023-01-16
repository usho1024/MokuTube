class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    user = User.find(params[:id])
    if user == current_user && params.key?(:stay_time)
      user.total_stay_time += params[:stay_time]
      user.save
      render status: :ok
    elsif user == current_user
      user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :work, :avatar)
  end
end
