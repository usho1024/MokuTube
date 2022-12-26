class RoomChannel < ApplicationCable::Channel
  # ルームID毎にストリームを別ける
  def subscribed
    stream_from "room#{params[:room]}"
  end

  # 退室の際にカレントユーザーの席情報を削除する
  def unsubscribed
    if RoomsUser.exists?(room_id: params[:room], user_id: current_user.id)
      RoomsUser.find_by(room_id: params[:room], user_id: current_user.id).destroy
      room_users = RoomsUser.where(room_id: params[:room]).includes(:user)
      room_users.map { |room_user| room_user.detail = {
                                                      avatar: room_user.user.avatar.thumb.url
                                                      }
                     }
      content = {
                 type: 'getSeat',
                 body: room_users
                }
      ActionCable.server.broadcast("room#{params[:room]}", content)
    end
  end

  # チャットのメッセージを作成する
  def speak(data)
    Message.create!(
      room_id: params[:room],
      user_id: current_user.id,
      body: data['message']
    )
  end

  # ルームの席を確保する
  def get_seat(data)
    if RoomsUser.exists?(room_id: params[:room], seat_number: data['seat_number'])
      return
    elsif RoomsUser.exists?(room_id: params[:room], user_id: current_user.id)
      RoomsUser.find_by(room_id: params[:room], user_id: current_user.id).destroy
    end
    RoomsUser.create!(
      room_id: params[:room],
      user_id: current_user.id,
      # work: data['work'],
      seat_number: data['seat_number'],
      x_coord: data['x_coord'],
      y_coord: data['y_coord']
    )
  end
end
