100.times do |n|
  n += 1
  RoomsUser.create!(
    room_id: n,
    user_id: 1,
    seat_number: 1,
    x_coord: 0,
    y_coord: 0,
  )
end

puts "rooms_users = #{RoomsUser.count}"
