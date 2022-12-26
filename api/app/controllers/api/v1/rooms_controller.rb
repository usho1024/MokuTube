class Api::V1::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    rooms = Room.all
    # rooms.map do |room|
    #   room.user_name = room.user.name
    #   room.user_count = room.rooms_users.count
    # end
    render json: rooms
  end
end
