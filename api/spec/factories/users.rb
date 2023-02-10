FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    total_stay_time { 0 }
  end
end
