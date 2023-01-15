class RoomUserBroadcastJob < ApplicationJob
  queue_as :default

  def perform(room_user)
    room_users = RoomsUser.where(room_id: room_user.room_id).includes(:user)
    room_users.map do |room_user|
      room_user.detail = {
        id: room_user.user.id,
        name: room_user.user.name,
        avatar: room_user.user.avatar.thumb.url,
        work: room_user.user.work,
        time: room_user.user.total_stay_time
      }
    end
    content = {
      type: 'getSeat',
      body: room_users
    }
    ActionCable.server.broadcast("room#{room_user.room_id}", content)
  end
end
