class Borrower < ActiveRecord::Base
  has_one :card
  has_many :borrower_purchases, :through => :card
  has_many :borrower_payments

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :first_name, length: { in: 2..15, message: "wrong name length"}

  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :last_name, length: { in: 2..15, message: "wrong name length"}

  validates :phone_number, length: { is: 10, message: "wrong phone length"}
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: "only allows numbers"}

  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  def amount_unpaid
    self.card.credit_used - self.total_payments
  end

  def total_payments
    self.borrower_payments.inject(0) do |sum,payment|
      sum + payment.amount
    end
  end



end

# create_table "borrowers", force: :cascade do |t|
#   t.string "first_name"
#   t.string "last_name"
#   t.bigint "phone_number"
#   t.string "email"
#   t.string "address"
# end
