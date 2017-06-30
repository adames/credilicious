require_relative "../config/environment.rb"

borrowers = []

11.times do |i|
  borrowers << Borrower.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::Number.number(10), email: Faker::Internet.email, address: Faker::Address.street_address)
  Card.create(borrower_id: borrowers.last.id, credit_line: Faker::Number.between(1000,10000))
end

new_id = 0
100.times do |i|
  BorrowerPayment.create(amount: Faker::Number.decimal(2, 2), borrower_id: borrowers[new_id].id)
  BorrowerPurchase.create(amount: Faker::Number.decimal(2, 2), seller: Faker::Company.name, card_id: borrowers[new_id].card.id)
  new_id +=1 if i % 10 == 0
end
