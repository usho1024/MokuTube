class RoomUserBroadcastJob < ApplicationJob
  queue_as :default

  def perform(room_user)
    room_users = RoomsUser.where(room_id: room_user.room_id).includes(:user)
    room_users.map { |room_user| room_user.detail = {
                                                     avatar: room_user.user.avatar.thumb.url
                                                    }
                   }
    content = {
               type: 'getSeat',
               body: room_users
              }
    ActionCable.server.broadcast("room#{room_user.room_id}", content)
  end
end
