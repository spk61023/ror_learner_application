# spec/graphql/queries_spec.rb

require 'rails_helper'

RSpec.describe "GraphQL queries", type: :request do
  describe "balance query" do
    it "returns the balance of an account" do
      account = create(:account, balance: 1000.0)

      post "/graphql", params: { query: "{ balance(accountId: \"#{account.id}\") }" }

      json_response = JSON.parse(response.body)
      expect(json_response["data"]["balance"]).to eq(1000.0)
    end
  end

  describe "history query" do
    it "returns the transaction history for an account" do
      account = create(:account)
      history = create(:history, source_account: account)

      post "/graphql", params: { query: "{ history(accountId: \"#{account.id}\") { id sourceAccountId destinationAccountId transactionDate status } }" }

      json_response = JSON.parse(response.body)
      expect(json_response["data"]["history"][0]["id"]).to eq(history.id.to_s)
      # Add more expectations as needed for other fields
    end
  end
end
