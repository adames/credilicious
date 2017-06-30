class Borrower < ActiveRecord::Base
  has_one :card
  has_many :borrower_purchases, :through => :card
  has_many :borrower_payments

  def amount_unpaid
    self.card.credit_used - self.total_payments
  end

  def total_payments
    self.borrower_payments.inject(0) do |sum,payment|
      sum + payment.amount
    end
  end
end
