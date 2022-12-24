class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.name = message.user.name
    message.avatar = message.user.avatar.thumb.url
    content = {
      type: 'speak',
      body: message
    }
    ActionCable.server.broadcast("room#{message.room_id}", content)
  end
end
