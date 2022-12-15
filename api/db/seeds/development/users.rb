User.create!(
  name: "admin",
  email: "admin@example.com",
  password: "password",
  admin: true
)

10.times do |n|
  n += 1
  name = "user#{n}"
  User.create!(
    name: "#{name}",
    email: "#{name}@example.com",
    password: "password"
  )
end

puts "users = #{User.count}"
