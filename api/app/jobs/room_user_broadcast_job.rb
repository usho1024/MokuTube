class RoomUserBroadcastJob < ApplicationJob
  queue_as :default

  def perform(room_user)
    users = RoomsUser.where(room_id: room_user.room_id)
    content = {
      type: 'getSeat',
      body: users
    }
    ActionCable.server.broadcast("room#{room_user.room_id}", content)
  end
end
