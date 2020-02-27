# frozen_string_literal: true

User.create!(name: 'Seungcheol Jung',
             email: 'scjung@gtone.co.kr',
             password: 'qwer1234',
             password_confirmation: 'qwer1234',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'Example User',
             email: 'example@example.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@example.com"
  password = 'password'
  User.create!(name: name, email: email,
               password: password, password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
