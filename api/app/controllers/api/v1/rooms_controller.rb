class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    rooms = Room.all.limit(50).includes([:user, :room_image])
    rooms.map do |room|
      room.host = {
        name: room.user.name,
        avatar: room.user.avatar.thumb.url
      }
      room.image = {
        name: room.room_image.image_name,
        number_of_seats: room.room_image.number_of_seats
      }
      room.active_users = room.rooms_users.count
    end
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
    room.image = { name: room.room_image.image_name }
    render json: room
  end

  def create
    room = Room.new(room_params)
    room.user_id = current_user.id
    room.save
    render json: room
  end

  private

  def room_params
    params.require(:room).permit(:room_image_id, :name, :video_id)
  end
end
