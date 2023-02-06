require 'rails_helper'

RSpec.describe "Api::V1::Homes", type: :request do
  let(:room_image) { create(:room_image) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:room) { create(:room, room_image:, user: user1) }

  describe "GET /index" do
    it "アクティブユーザーの数（2名）を取得できること" do
      create(:rooms_user, user: user1, room:, seat_number: 1)
      create(:rooms_user, user: user2, room:, seat_number: 2)
      get "/api/v1/homes"
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json).to eq(2)
    end
  end
end
