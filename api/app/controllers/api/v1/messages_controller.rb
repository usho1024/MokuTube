class Api::V1::MessagesController < ApplicationController
  def index
    messages = Message.all.includes(:user)
    messages.map { |message| message[:name] = message.user.name }
    render json: messages.as_json(only: [:body, :name])
  end
end
