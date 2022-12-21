class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    messages = Message.where(room_id: params[:id]).limit(50).reverse_order.includes(:user)
    messages.map do |message|
      message.name = message.user.name
      message.avatar = message.user.avatar.thumb.url
    end
    render json: messages
  end
end
