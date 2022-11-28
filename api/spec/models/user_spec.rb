require 'rails_helper'

RSpec.describe User, type: :model do
  it '正常テスト' do
    @user = User.new(
      name: 'あ',
      email: 'aaa@google.com',
      password: 'password'
    )
    expect(@user).to be_valid
  end
end
