require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation" do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end
  end
end
