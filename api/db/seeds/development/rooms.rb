10.times do |n|
  n += 1
  Room.create!(
    room_image_id: n,
    user_id: 1,
    name: "公式ルーム#{n}",
    bgm_resource: "T63mhC9wBT8"
  )
end

100.times do |n|
  n += 1
  Room.create!(
    room_image_id: 6,
    user_id: 2,
    name: "テストルーム#{n}",
    bgm_resource: "T63mhC9wBT8"
  )
end

puts "rooms = #{Room.count}"
