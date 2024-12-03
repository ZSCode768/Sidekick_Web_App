require 'rails_helper'

RSpec.describe Spell, type: :model do
  describe "validation" do
    it 'is valid with valid attributes' do
      character_class = create(:character_class)
      spell = build(:spell, character_class: character_class)
      expect(spell).to be_valid
    end

    it 'is not valid without a name' do
      spell = build(:spell, name: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:name]).to include("can't be blank")
    end

    it 'is not valid without a level' do
      spell = build(:spell, level: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:level]).to include("is not a number")
    end

    it 'is not valid with a level less than 0' do
      spell = build(:spell, level: -1)
      expect(spell).not_to be_valid
      expect(spell.errors[:level]).to include("must be greater than or equal to 0")
    end

    it 'is not valid with a level greater than 9' do
      spell = build(:spell, level: 10)
      expect(spell).not_to be_valid
      expect(spell.errors[:level]).to include("must be less than or equal to 9")
    end

    it 'is not valid without a casting time' do
      spell = build(:spell, casting_time: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:casting_time]).to include("can't be blank")
    end

    it 'is not valid without a duration' do
      spell = build(:spell, duration: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:duration]).to include("can't be blank")
    end

    it 'is not valid without a school' do
      spell = build(:spell, school: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:school]).to include("can't be blank")
    end

    it 'is not valid without a range' do
      spell = build(:spell, range: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:range]).to include("can't be blank")
    end

    it 'is not valid without a components' do
      spell = build(:spell, components: nil)
      expect(spell).not_to be_valid
      expect(spell.errors[:components]).to include("can't be blank")
    end
  end
end
