module Mutations
  class TransferMoney < BaseMutation
    argument :source_account_id, ID, required: true
    argument :destination_account_id, ID, required: true
    argument :amount, Float, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(source_account_id:, destination_account_id:, amount:)
      source_account = Account.find_by(id: source_account_id)
      destination_account = Account.find_by(id: destination_account_id)

      if source_account.nil? || destination_account.nil?
        return { success: false, errors: ["One or both accounts not found."] }
      end

      if source_account.balance < amount
        return { success: false, errors: ["Insufficient balance in source account."] }
      end

      ActiveRecord::Base.transaction do
        source_account.update!(balance: source_account.balance - amount)
        destination_account.update!(balance: destination_account.balance + amount)
      end

      { success: true, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, errors: e.record.errors.full_messages }
    end
  end
end

