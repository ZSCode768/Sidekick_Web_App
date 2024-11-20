class Character < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :level, numericality { only_integer: true, greater_than_or_equal_to: 1 }
end
