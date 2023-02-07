class Api::V1::UsersController < ApplicationController
  include Common
  before_action :authenticate_user!, :reject_expired_user
  before_action :set_user

  def show
    render json: @user
  end

  def update
    if @user == current_user && params.key?(:stay_time)
      @user.total_stay_time += params[:stay_time].to_i
      @user.save
      render status: :ok
    elsif @user == current_user
      @user.update(user_params)
      render json: @user
    else
      render status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :work, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
