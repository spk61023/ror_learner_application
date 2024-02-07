FactoryBot.define do
  factory :history do
    history_id { 1 }
    description { "MyString" }
    source_account { nil }
    destination_account { nil }
    transaction_date { "2024-02-07" }
    status { false }
  end
end
