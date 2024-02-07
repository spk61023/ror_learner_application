# db/seeds.rb

# Create sample accounts
10.times do |i|
  Account.create(
    name: "Account #{i+1}",
    email: "account#{i+1}@example.com",
    password: "password",
    balance: rand(1000.0..5000.0)
  )
end

# Create sample transaction histories
Account.all.each do |account|
  5.times do
    source_account = Account.where.not(id: account.id).sample
    destination_account = Account.where.not(id: account.id, id: source_account.id).sample
    transaction_date = Faker::Time.between(from: 1.year.ago, to: Time.now)
    status = [true, false].sample

    History.create(
      source_account_id: source_account.id,
      destination_account_id: destination_account.id,
      transaction_date: transaction_date,
      status: status
    )
  end
end
