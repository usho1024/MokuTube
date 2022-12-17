FactoryBot.define do
  factory :room_image do
    name { 'テストイメージ' }
    image_name { 'test' }
    number_of_seats { 5 }
  end
end
