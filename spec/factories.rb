FactoryBot.define do
    factory(:user) do
      username { Faker::Internet.username }
      email { Faker::Internet.email }
      password { "password" }
      password_confirmation { "password" }
    end

    factory(:character_class) do
      name{ "Eldritch Vessel "}
      description { "Similar to Warlock" }
    end

    factory(:character) do
      name{ "Hello World" }
      level{ 1 }
      description{ "Fighter from the digital world" }
      association :character_class
      association :user
      strength{ 10 }
      dexterity{ 10 }
      constitution{ 10 }
      intelligence{ 10 }
      wisdom{ 10 }
      charisma{ 10 }
      abilities{ "Says Hello" }
    end

end
   