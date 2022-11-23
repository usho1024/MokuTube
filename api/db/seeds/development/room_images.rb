rooms = [
  ["個室", "private_room", 1],
  ["小さいオフィス", "small_office", 2],
  ["大きいオフィス", "large_office", 4],
  ["夜のバー", "night_bar", 4],
  ["休憩スペース", "rest_area", 5],
  ["キッチン", "kitchen", 6],
  ["ブックカフェ", "book_cafe", 7],
  ["教室", "classroom", 10],
  ["カフェ", "cafe", 16],
  ["ラウンジ", "lounge", 20]
]

rooms.each do |name, image_name, number_of_seats|
  RoomImage.create!(
    name: name,
    image_name: image_name,
    number_of_seats: number_of_seats
  )
end

puts "room_images = #{RoomImage.count}"
