class Api::V1::RoomsUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = RoomsUser.where(room_id: params[:id])
    render json: users
  end
end
