class CharacterClass < ApplicationRecord
    has_many :spells
    has_many :characters

    validates :name, presence: true, uniqueness: true
    validates :description, presence:true
end
