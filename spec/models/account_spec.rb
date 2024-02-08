require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      account = build(:account)
      expect(account).to be_valid
    end

    it "is not valid without a name" do
      account = build(:account, name: nil)
      expect(account).not_to be_valid
    end

    # Add more validation tests as needed
  end

  describe "associations" do
    it "has many histories" do
      association = described_class.reflect_on_association(:histories)
      expect(association.macro).to eq :has_many
    end

  end
end