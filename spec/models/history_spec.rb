require 'rails_helper'

RSpec.describe History, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      history = build(:history, source_account: Account.new, destination_account: Account.new)
      expect(history).to be_valid
    end

    it "is not valid without a source_account_id" do
      history = build(:history, source_account_id: nil)
      expect(history).not_to be_valid
    end

  end

  describe "associations" do
    it "belongs to source_account" do
      association = described_class.reflect_on_association(:source_account)
      expect(association.macro).to eq :belongs_to
    end

    it "belongs to destination_account" do
      association = described_class.reflect_on_association(:destination_account)
      expect(association.macro).to eq :belongs_to
    end

    # Add more association tests as needed
  end
end
