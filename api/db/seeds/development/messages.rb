11.times do |n|
  room = Room.find(1)
  user = User.find(n+1)
  Message.create!(
    room_id: room.id,
    user_id: user.id,
    body: "#{room.name}に投稿された#{user.name}による#{n+1}番目のメッセージです。"
  )
end

puts "messages = #{Message.count}"
