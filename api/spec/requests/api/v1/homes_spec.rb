require 'rails_helper'

RSpec.describe "Api::V1::Homes", type: :request do
  describe "GET /index" do
    it "現在のアクティブユーザーが取得できること" do
      get "/api/v1/homes"
      expect(response).to have_http_status(:success)
    end
  end
end
