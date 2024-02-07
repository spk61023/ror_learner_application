module Types
  class HistoryType < Types::BaseObject
    field :id, ID, null: false
    field :source_account_id, ID, null: false
    field :destination_account_id, ID, null: false
    field :transaction_date, GraphQL::Types::ISO8601DateTime, null: false
    field :status, Boolean, null: false
  end
end

