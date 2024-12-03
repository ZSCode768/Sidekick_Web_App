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

    factory(:spell) do
      name{ "fireball" }
      level{ 3 }
      casting_time{ "1 action" }
      duration{ "instant" }
      school{ "evocation" }
      range{ "120 feet" }
      components{ "V, S"}
      description { "A bright streak flashes from your pointing finger..." }
      association :character_class
    end
end
   