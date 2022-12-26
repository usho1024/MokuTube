class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    messages = Message.where(room_id: params[:id]).limit(50).reverse_order.includes(:user)
    messages.map { |message| message.sender = {
                                               name: message.user.name,
                                               avatar: message.user.avatar.thumb.url
                                              }
                 }
    render json: messages
  end
end
