10.times do |n|
  n += 1
  Room.create!(
    room_image_id: n,
    user_id: 1,
    name: "テストルーム#{n}",
    bgm_resource: "T63mhC9wBT8"
  )
end

puts "rooms = #{Room.count}"
