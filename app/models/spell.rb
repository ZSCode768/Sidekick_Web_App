class Spell < ApplicationRecord
  belongs_to :character_class

  validates :name, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9}
  validates :casting_time, presence: true
  validates :duration, presence: true
  validates :school, presence: true
  validates :range, presence: true
  validates :components, presence: true
end
