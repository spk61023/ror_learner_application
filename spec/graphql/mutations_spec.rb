# spec/graphql/mutations_spec.rb

require 'rails_helper'

RSpec.describe "GraphQL mutations", type: :request do
  describe "transfer_money mutation" do
    it "transfers money between accounts" do
      source_account = create(:account, balance: 1000.0)
      destination_account = create(:account, balance: 500.0)

      post "/graphql", params: { query: "mutation { transferMoney(input: { sourceAccountId: \"#{source_account.id}\", destinationAccountId: \"#{destination_account.id}\", amount: 200.0 }) { success } }" }

      json_response = JSON.parse(response.body)
      expect(json_response["data"]["transferMoney"]["success"]).to eq(true)
    end
  end

  describe "create_account mutation" do
    it "creates a new account" do
      post "/graphql", params: { query: "mutation { createAccount(input: { name: \"Test User\", email: \"test@example.com\", password: \"password123\", balance: 1000.0 }) { account { id } } }" }

      json_response = JSON.parse(response.body)
      expect(json_response["data"]["createAccount"]["account"]["id"]).not_to be_nil
    end
  end
end

