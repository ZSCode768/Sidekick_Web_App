class Character < ApplicationRecord
  belongs_to :character_class
  belongs_to :user
  validates :name, presence: true
  validates :character_class_id, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :strength, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :dexterity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :constitution, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :intelligence, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :wisdom, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :charisma, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
