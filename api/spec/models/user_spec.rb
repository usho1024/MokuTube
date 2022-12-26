require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデルのバリデーションテスト' do
    context '正常である場合' do
      let(:user) { build(:user) }

      it '正常テスト' do
        expect(user).to be_valid
      end
    end

    context 'メールアドレスが不正である場合' do
      let(:user) { build(:user, email: 'testexample.com') }

      it 'testexample.comは@を含まないので無効になること' do
        expect(user).to be_invalid
      end
    end

    context 'パスワードが不正である場合' do
      let(:user) { build(:user, password: 'passw') }

      it 'passwは6文字未満なので無効になること' do
        expect(user).to be_invalid
      end
    end

    context '名前が空白である場合' do
      let(:user) { build(:user, name: '') }

      it '空白は無効になること' do
        expect(user).to be_invalid
      end
    end

    context '名前が30文字を超過する場合' do
      let(:user) { build(:user, name: "#{'あ' * 31}") }

      it 'あ*31は無効になること' do
        expect(user).to be_invalid
      end
    end

    context '自己紹介文が300文字を超過する場合' do
      let(:user) { build(:user, introduction: "#{'い' * 301}") }

      it 'い*301は無効になること' do
        expect(user).to be_invalid
      end
    end
  end
end
