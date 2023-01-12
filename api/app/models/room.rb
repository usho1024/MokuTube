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

  scope :recent, -> { order(created_at: :desc).limit(100).includes([:user, :room_image]) }
  scope :active, -> { find(RoomsUser.group(:room_id).order('count(room_id) desc').pluck(:room_id)) }
end
