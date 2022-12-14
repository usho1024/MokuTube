class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room#{message.room_id}", message: render_json(message)
  end

  private

  def render_json(message)
    message[:name] = message.user.name
    render json: message.as_json(only: [:body, :name])
  end

end
