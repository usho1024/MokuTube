require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let!(:user) { create(:user) }
  let!(:auth_tokens) { sign_in(user) }

  describe "GET /show" do
    it "ユーザーの詳細を取得できること" do
      get "/api/v1/users/#{user.id}", headers: auth_tokens
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json['id']).to eq(user.id)
    end
  end

  describe "PATCH /update" do
    context "正常テスト" do
      it "ユーザーの情報を更新できること" do
        patch "/api/v1/users/#{user.id}", headers: auth_tokens, params: { user: {name: 'hoge'}  }
        json = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json['name']).to eq('hoge')
      end

      it "ユーザーの総勉強時間を更新できること" do
        patch "/api/v1/users/#{user.id}", headers: auth_tokens, params: { stay_time: 10 }
        expect(response.status).to eq(200)
      end
    end

    context "異常テスト" do
      let!(:user2) { create(:user) }

      it "不正なパラメーターが送信されたら401を返すこと" do
        patch "/api/v1/users/#{user2.id}", headers: auth_tokens, params: { user: {name: 'hoge'}  }
        expect(response.status).to eq(401)
      end
    end
  end
end
