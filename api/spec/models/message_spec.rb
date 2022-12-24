require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージモデルのバリデーションテスト' do
    let(:room_image) { create(:room_image) }
    let(:user) { create(:user) }
    let(:room) { create(:room, room_image: room_image, user: user) }

    context '正常である場合' do
      let(:message) { build(:message, room: room, user: user) }
      it '正常テスト' do
        expect(message).to be_valid
      end
    end

    context 'メッセージが空白である場合' do
      let(:message) { build(:message, room: room, user: user, body: '') }
      it '空白は無効になること' do
        expect(message).to be_invalid
      end
    end

    context 'メッセージが200文字を超過する場合' do
      let(:message) { build(:message, room: room, user: user, body: "#{'あ'*201}") }
      it 'あ*201は無効になること' do
        expect(message).to be_invalid
      end
    end
  end
end
