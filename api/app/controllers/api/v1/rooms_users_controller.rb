class Api::V1::RoomsUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    room_users = RoomsUser.where(room_id: params[:id]).includes(:user)
    room_users.map do |room_user|
      room_user.detail = {
        avatar: room_user.user.avatar.thumb.url
      }
    end
    render json: room_users
  end
end
