# == Schema Information
#
# Table name: borrower_purchases
#
#  id      :integer          not null, primary key
#  amount  :float
#  seller  :string
#  card_id :integer
#

class BorrowerPurchase < ActiveRecord::Base
  belongs_to :card

  validate :active_credit_card, :credit_limit_not_exceeded


  def active_credit_card
    if !self.card.active
      errors.add(:card, "is not active")
    end
  end

  def credit_limit_not_exceeded
    if self.card.credit_used + self.amount > self.card.credit_line
      errors.add(:borrower_purchase, "exceeds credit limit")
    end
  end

end
