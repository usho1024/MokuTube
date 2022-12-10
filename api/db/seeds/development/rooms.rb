Room.create!(
  room_image_id: 5,
  user_id: 1,
  name: "テストルーム（休憩スペース・admin）",
  bgm_name: "ジャズ　作業用BGM　ジャズピアノ　Jazz Piano BGM 　著作権フリー Playlist",
  bgm_url: "https://www.youtube.com/watch?v=T63mhC9wBT8"
)

puts "rooms = #{Room.count}"

