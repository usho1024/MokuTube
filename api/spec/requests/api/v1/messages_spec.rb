require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe 'メッセージに関するリクエストのテスト' do
    it 'GET /api/v1/messagesは成功すること' do
      get '/api/v1/messages'
      expect(response).to have_http_status(:success)
    end
  end
end
