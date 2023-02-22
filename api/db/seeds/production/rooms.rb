8.times do |n|
  n += 3
  Room.create!(
    room_image_id: n,
    user_id: 1,
    name: RoomImage.find(n).name,
    bgm_resource: "TPUY_TJLHmE"
  )
end

puts "rooms = #{Room.count}"
