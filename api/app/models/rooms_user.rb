class RoomsUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :work, length: { maximum: 30 }
  validates :room_id, uniqueness: {
                                    scope: :seat_number,
                                    message: "他の席をご利用ください"
                                  }
end
