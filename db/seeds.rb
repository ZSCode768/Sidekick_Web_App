# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Find or create the user account
user = User.find_or_create_by(email: 'example@example.com') do |u|
    u.username = 'exampleuser'
    u.password = 'password123'
  end
  
  # Create 50 characters for the user
  character_classes = CharacterClass.all

  50.times do |i|
    user.characters.create!(
      name: "Character #{i + 1}",
      level: rand(1..20), # Random level between 1 and 20
      description: "Description for Character #{i + 1}",
      strength: rand(1..18),
      dexterity: rand(1..18),
      constitution: rand(1..18),
      intelligence: rand(1..18),
      wisdom: rand(1..18),
      charisma: rand(1..18),
      abilities: "Abilities for Character #{i + 1}",
      character_class: character_classes.sample #assign a random class
    )
  end  