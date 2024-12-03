require 'rails_helper'

RSpec.describe Character, type: :model do
    describe "validation" do
      it 'is valid with valid attributes' do
        character_class = create(:character_class)
        puts character_class.inspect
        character = build(:character, character_class_id: character_class.id)
        expect(character).to be_valid
      end
  
      it 'is not valid without a name' do
        character = build(:character, name: nil)
        expect(character).not_to be_valid
        expect(character.errors[:name]).to include("can't be blank")
      end
  
      it 'is not valid without a level' do
        character = build(:character, level: nil)
        expect(character).not_to be_valid
        expect(character.errors[:level]).to include("is not a number")
      end
  
      it 'is not valid with a level less than 1' do
        character = build(:character, level: 0)
        expect(character).not_to be_valid
        expect(character.errors[:level]).to include("must be greater than or equal to 1")
      end

      it 'is not valid with a strength less than 1' do
        character = build(:character, strength: 0)
        expect(character).not_to be_valid
        expect(character.errors[:strength]).to include("must be greater than or equal to 1")
      end

      it 'is not valid with a dexterity less than 1' do
        character = build(:character, dexterity: 0)
        expect(character).not_to be_valid
        expect(character.errors[:dexterity]).to include("must be greater than or equal to 1")
      end

      it 'is not valid with a constitution less than 1' do
        character = build(:character, constitution: 0)
        expect(character).not_to be_valid
        expect(character.errors[:constitution]).to include("must be greater than or equal to 1")
      end

      it 'is not valid with a intelligence less than 1' do
        character = build(:character, intelligence: 0)
        expect(character).not_to be_valid
        expect(character.errors[:intelligence]).to include("must be greater than or equal to 1")
      end

      it 'is not valid with a wisdom less than 1' do
        character = build(:character, wisdom: 0)
        expect(character).not_to be_valid
        expect(character.errors[:wisdom]).to include("must be greater than or equal to 1")
      end

      it 'is not valid with a charisma less than 1' do
        character = build(:character, charisma: 0)
        expect(character).not_to be_valid
        expect(character.errors[:charisma]).to include("must be greater than or equal to 1")
      end
    end
end
  