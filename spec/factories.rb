FactoryBot.define do
    factory(:student) do
      username { Faker::Internet.username }
      email { "student1@msudenver.edu" }
      password { "password" }
      password_confirmation { "password" }
    end
end
   