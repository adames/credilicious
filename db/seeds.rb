require_relative "../config/environment.rb"

borrowers = []

11.times do |i|
  borrowers << Borrower.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: Faker::Number.number(10), email: Faker::Internet.email, address: Faker::Address.street_address, social_security: Faker::Number.number(9))
  Card.create(borrower_id: borrowers.last.id, credit_line: Faker::Number.between(1000,10000))
end

new_id = 1
100.times do |i|
  Borrower.find(new_id).borrower_payments << BorrowerPayment.create(amount: Faker::Number.decimal(2, 2))
  Borrower.find(new_id).card.borrower_purchases << BorrowerPurchase.new(amount: Faker::Number.decimal(2, 2), seller: Faker::Company.name)
  BorrowerPurchase.last.save
  new_id +=1 if i % 10 == 0
end

payroll = []
6.times do |i|
  payroll << PayrollCompany.create(name:Faker::Company.name)
end

new_id = 1
employers = []
20.times do |i|
  employers << Employer.create(name:Faker::Company.name)
  PayrollCompany.find(new_id).employers << employers[i]
  new_id += 1 if i%4 == 0
end

employment_history = []
borrower_id = 1
20.times do |i|
  employment_history << EmploymentHistory.create(salary:Faker::Number.decimal(6,2), start_date:Faker::Date.backward(700),end_date:Faker::Date.backward(700),job_title:Faker::Job.title)
  borrower_id +=1 if i%2==0
  Borrower.find(borrower_id).employment_histories << employment_history[i]
  Employer.find(i+1).employment_histories << employment_history[i]
end
