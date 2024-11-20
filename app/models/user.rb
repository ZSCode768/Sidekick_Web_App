class User < ApplicationRecord
    has_secure_password
    has_many :characters, dependent: :destroy
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
