require 'rails_helper'

RSpec.describe "Api::V1::RoomsUsers", type: :request do
  describe "GET /index" do
    let(:room_image) { create(:room_image) }
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:room) { create(:room, room_image:, user: user1) }
    let(:auth_tokens) { sign_in(user1) }

    it "ルームに存在するユーザー（2名）を取得できること" do
      create(:rooms_user, user: user1, room:, seat_number: 1)
      create(:rooms_user, user: user2, room:, seat_number: 2)
      get api_v1_rooms_users_path, headers: auth_tokens, params: { id: room.id }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json.length).to eq(2)
    end
  end
end
