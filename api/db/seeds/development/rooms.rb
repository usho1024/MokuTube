10.times do |n|
  n += 1
  Room.create!(
    room_image_id: n,
    user_id: 1,
    name: "テストルーム#{n}",
    bgm_name: "ジャズ　作業用BGM  ジャズピアノ　Jazz Piano BGM  著作権フリー Playlist",
    bgm_url: "https://www.youtube.com/watch?v=T63mhC9wBT8"
  )
end

puts "rooms = #{Room.count}"
