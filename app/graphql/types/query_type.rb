module Types
  class QueryType < Types::BaseObject
    field :balance, Float, null: true do
      description "View the balance of an account"
      argument :account_id, ID, required: true
    end

    field :history, [Types::HistoryType], null: true do
      description "View the transaction history for an account"
      argument :account_id, ID, required: true
    end

    def balance(account_id:)
      account = Account.find_by(id: account_id)
      account&.balance
    end

    def history(account_id:)
      account = Account.find_by(id: account_id)
      account&.history
    end
  end
end
