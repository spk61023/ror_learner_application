FactoryBot.define do
  factory :history do
    history_id { 1 }
    description { 'Transaction 1' }
    source_account { Account.new }
    destination_account { Account.new }
    transaction_date { '2024-02-07' }
    status { false }
  end

end
