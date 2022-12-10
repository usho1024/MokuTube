class Message < ApplicationRecord
  # jsonでメッセージの投稿者名を返す用（attributes API）
  attribute :name

  # メッセージの保存に成功したらBroadCastJobに投げる
  after_create_commit { BroadCastMessageJob.perform_later self }

  belongs_to :user
  belongs_to :room

  validates :body, presence: true,
                   length: {
                     maximum: 200,
                     allow_blank: true
                   }
end
