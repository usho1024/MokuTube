class RoomsUser < ApplicationRecord
  attribute :detail

  belongs_to :user
  belongs_to :room

  validates :user_id, uniqueness: { scope: :room_id }
  validates :room_id, uniqueness: {
                                   scope: :seat_number,
                                   message: "他の席をご利用ください"
                                  }

  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  after_create_commit { RoomUserBroadcastJob.perform_later self }
end
