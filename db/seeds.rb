require_relative "../config/environment.rb"

borrowers = []

11.times do |i|
  borrowers << Borrower.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::Number.number(10), email: Faker::Internet.email, address: Faker::Address.street_address)
end

transactions = []
new_id = 0
100.times do |i|
  transactions << Transaction.create(amount: Faker::Number.decimal(2, 2), seller: Faker::Company.name)
  Card.create(borrower_id: borrowers[new_id].id, transaction_id: transactions.last.id)
  new_id +=1 if i % 10 == 0
end
