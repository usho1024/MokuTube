class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from("room#{params[:room]}")
  end

  def speak(data)
    Message.create!(
      room_id: data['room_id'],
      user_id: data['user_id'],
      body: data['message']
    )
  end
end
