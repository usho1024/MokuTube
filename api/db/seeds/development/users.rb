User.create!(
  name: "admin",
  email: "admin@example.com",
  password: "password",
)

10.times do |n|
  n += 1
  name = "user#{n}"
  User.create!(
    name: "#{name}",
    email: "#{name}@example.com",
    password: "password",
    work: "ポートフォリオ作成"
  )
end

puts "users = #{User.count}"
