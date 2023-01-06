class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :avatar, AvatarUploader

  has_many :rooms
  has_many :rooms_users
  has_many :messages

  validates :name, presence: true,
                   length: {
                     maximum: 30,
                     allow_blank: true
                   }
  validates :introduction, length: { maximum: 300 }
  validates :work, length: { maximum: 30 }
end
