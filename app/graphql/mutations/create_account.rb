module Mutations
  class CreateAccount < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :balance, Float, required: true

    field :account, Types::AccountType, null: false
    field :errors, [String], null: false

    def resolve(name:, email:, password:, balance:)
      account = Account.new(
        name: name,
        email: email,
        password: password,
        balance: balance
      )

      if account.save
        { account: account, errors: [] }
      else
        { account: nil, errors: account.errors.full_messages }
      end
    end
  end
end

