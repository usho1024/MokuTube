User.create!(
  name: "MokuTube公式",
  email: ENV.fetch("ADMIN_ID", nil),
  password: ENV.fetch("ADMIN_PASS", nil)
)

puts "users = #{User.count}"
