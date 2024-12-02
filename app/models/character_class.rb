class CharacterClass < ApplicationRecord
    has_many :spells

    validates :name, presence: true, uniqueness: true
    validates :description, presence:true
end
