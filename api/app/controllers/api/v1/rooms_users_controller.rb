class Api::V1::RoomsUsersController < ApplicationController
  include Common
  before_action :authenticate_user!, :reject_expired_user

  def index
    room_users = RoomsUser.where(room_id: params[:id]).includes(:user)
    room_users.map do |room_user|
      room_user.detail = {
        id: room_user.user.id,
        name: room_user.user.name,
        avatar: room_user.user.avatar.thumb.url,
        work: room_user.user.work,
        time: room_user.user.total_stay_time,
        introduction: room_user.user.introduction
      }
    end
    render json: room_users
  end
end
