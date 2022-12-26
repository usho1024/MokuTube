require 'rails_helper'

RSpec.describe "MessagesAPI", type: :request do
  describe 'GET /api/v1/messages' do
    let(:room_image) { create(:room_image) }
    let(:user) { create(:user) }
    let(:room) { create(:room, room_image:, user:) }
    let(:auth_tokens) { sign_in(user) }

    it 'ルームのチャットメッセージを取得できること' do
      create_list(:message, 10, user:, room:)
      get api_v1_messages_path, headers: auth_tokens, params: { id: room.id }
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json.length).to eq(10)
    end
  end
end
