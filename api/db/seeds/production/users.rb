User.create!(
  name: "MokuTube公式",
  email: ENV["ADMIN_ID"],
  password: ENV["ADMIN_PASS"]
)

puts "users = #{User.count}"
