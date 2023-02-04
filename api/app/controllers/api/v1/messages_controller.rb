class Api::V1::MessagesController < ApplicationController
  include Common
  before_action :authenticate_user!, :reject_expired_user

  def index
    messages = Message.where(room_id: params[:id]).limit(50).reverse_order.includes(:user).reverse
    messages.map do |message|
      message.sender = {
        name: message.user.name,
        avatar: message.user.avatar.thumb.url
      }
    end
    render json: messages
  end
end
