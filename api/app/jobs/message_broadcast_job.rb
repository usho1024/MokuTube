class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.name = message.user.name
    message.avatar = message.user.avatar.url
    ActionCable.server.broadcast("room#{message.room_id}", message)
  end

end
