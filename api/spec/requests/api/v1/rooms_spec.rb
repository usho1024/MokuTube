require 'rails_helper'

RSpec.describe "Api::V1::Rooms", type: :request do
  let!(:user) { create(:user) }
  let!(:room_image) { create(:room_image) }
  let!(:room) { create(:room, room_image:, user:) }
  let!(:auth_tokens) { sign_in(user) }

  describe "GET /index" do
    it "最新のルーム（30件）を取得できること" do
      create_list(:room, 100, room_image:, user:)
      get "/api/v1/rooms", headers: auth_tokens, params: { type: "recent", page_number: 1 }
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["rooms"].length).to eq(30)
    end
  end

  describe "GET /show" do
    it "ルームの詳細を取得できること" do
      get "/api/v1/rooms/#{room.id}", headers: auth_tokens
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["id"]).to eq(room.id)
    end
  end

  describe "POST /create" do
    it "新しいルームを作成できること" do
      valid_params = { room_image_id: room_image.id, name: "hoge", bgm_resource: "fuga" }
      expect { post "/api/v1/rooms", headers: auth_tokens, params: { room: valid_params } }.to change(Room, :count).by(+1)
      expect(response.status).to eq(200)
    end
  end
end
