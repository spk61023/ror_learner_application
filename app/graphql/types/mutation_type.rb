# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_account, mutation: Mutations::CreateAccount
    field :transfer_money, mutation: Mutations::TransferMoney
  end
end
