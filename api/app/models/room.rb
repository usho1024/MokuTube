class Room < ApplicationRecord
  attribute :host
  attribute :image
  attribute :active_users

  belongs_to :user
  belongs_to :room_image
  has_many :rooms_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true,
    length: {
      maximum: 30,
      allow_blank: true
    }

    scope :active, -> (page_number) {
      includes([:user, :room_image]).find(RoomsUser.group(:room_id)
      .order('count(room_id) desc').pluck(:room_id)).slice(30 * (page_number - 1), 30)
    }
    scope :recent, -> (page_number) {
      includes([:user, :room_image]).order(created_at: :desc).slice(30 * (page_number - 1), 30)
    }
    scope :count_active, -> {
      find(RoomsUser.group(:room_id).pluck(:room_id)).count
    }
end
