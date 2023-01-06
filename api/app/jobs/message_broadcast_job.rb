class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.sender = {
      name: message.user.name,
      avatar: message.user.avatar.thumb.url
    }
    content = {
      type: 'speak',
      body: message
    }
    ActionCable.server.broadcast("room#{message.room_id}", content)
  end
end
