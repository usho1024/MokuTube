class RoomChannel < ApplicationCable::Channel
  # ルームID毎にストリームを別ける
  def subscribed
    stream_from "room#{params[:room]}"
  end

  # チャットのメッセージを作成する
  def speak(data)
    Message.create!(
      room_id: params[:room],
      user_id: data['user'],
      body: data['message']
    )
  end

  # ルームの席を確保する
  def get_seat(data)
    # RoomsUsers.create!(
    #   room_id: params[:room],
    #   user_id: data['user'],
    #   work: data['work'],
    #   seat_number: data['seat_number'],
    #   x_coord: data['x_coord'],
    #   y_coord: data['y_coord']
    # )
  end
end
