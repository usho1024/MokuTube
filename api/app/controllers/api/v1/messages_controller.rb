class Api::V1::MessagesController < ApplicationController
  def index
    messages = Message.where(room_id: params[:id]).limit(50).reverse_order.includes(:user)
    messages.map { |message| message[:name] = message.user.name }
    render json: messages
  end
end
