class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end
end
