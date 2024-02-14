FactoryBot.define do
  factory :account do
    id { 1 }
    account_id { 1 }
    name { "User1" }
    email { "user1@gmail.com" }
    password { "1234" }
    balance { "9999" }
  end
end
