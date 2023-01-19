class Api::V1::HomesController < ApplicationController
  def index
    active_users = RoomsUser.count
    render json: active_users
  end
end
