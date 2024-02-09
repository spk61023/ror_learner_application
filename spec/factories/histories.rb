FactoryBot.define do
  factory :history do
    history_id { 1 }
    description { 'Transaction 1' }
    source_account { account }
    destination_account { account }
    transaction_date { '2024-02-07' }
    status { false }
  end

  transient do
    Account.new
  end
end
