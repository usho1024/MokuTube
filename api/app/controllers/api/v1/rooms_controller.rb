class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    case params[:query]
    when 'new'
      rooms = Room.order(created_at: :desc).limit(100).includes([:user, :room_image])
    when 'active'
      rooms = Room.find(RoomsUser.group(:room_id).order('count(room_id) desc').pluck(:room_id))
    when 'official'
      rooms = User.first.rooms.includes([:room_image])
    end
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
    params.require(:room).permit(:room_image_id, :name, :bgm_resource)
  end
end
