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


# create_table "borrower_purchases", force: :cascade do |t|
#   t.float "amount"
#   t.string "seller"
#   t.integer "card_id"
# end
