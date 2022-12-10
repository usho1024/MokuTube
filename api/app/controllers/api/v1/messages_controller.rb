class Api::V1::MessagesController < ApplicationController
  def index
    messages = []
    Message.all.includes(:user).each do |massage|
      massage[:name] = massage.user.name
      messages << massage
    end
    render json: messages.as_json(only: [:id, :body, :created_at, :name])
  end
end
