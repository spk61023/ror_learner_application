FactoryBot.define do
  factory :account do
    id { SecureRandom.random_number(1_000) }
    account_id { SecureRandom.random_number(1_000) }
    name { "User1" }
    email { "user1@gmail.com" }
    password { "1234" }
    balance { "9999" }
  end
end
