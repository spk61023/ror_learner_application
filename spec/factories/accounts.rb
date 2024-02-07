FactoryBot.define do
  factory :account do
    account_id { 1 }
    name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    balance { "9.99" }
  end
end
