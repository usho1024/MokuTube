# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'testuser' }
    email { 'test@example.com' }
    password { 'password' }
  end
end
