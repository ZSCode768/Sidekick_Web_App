require 'rails_helper'

RSpec.describe CharacterClass, type: :model do
  describe "validation" do
    it 'is valid with valid attributes' do
      character_class = build(:character_class)
      expect(character_class).to be_valid
    end

    it 'is not valid without a name' do
      character_class = build(:character_class, name: nil)
      expect(character_class).not_to be_valid
      expect(character_class.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a description' do
      character_class = build(:character_class, description: nil)
      expect(character_class).not_to be_valid
      expect(character_class.errors[:description]).to include("can't be blank")
    end
  end
end
