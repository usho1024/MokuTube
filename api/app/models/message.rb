class Message < ApplicationRecord
  attribute :sender

  belongs_to :user
  belongs_to :room

  validates :body, presence: true,
    length: {
      maximum: 200,
      allow_blank: true
    }

  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  after_create_commit { MessageBroadcastJob.perform_later self }
end
