# 100.times do |n|
#   n += 1
#   Message.create!(
#     room_id: 1,
#     user_id: 1,
#     body: "メッセージ#{n}"
#   )
# end

puts "messages = #{Message.count}"
