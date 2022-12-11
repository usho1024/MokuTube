require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'ユーザーに関するリクエストのテスト' do
    it 'GET /api/v1/usersは成功すること' do
      get '/api/v1/users'
      expect(response).to have_http_status(:success)
    end
  end
end
