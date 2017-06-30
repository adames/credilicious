class Card < ActiveRecord::Base
  belongs_to :borrower
  has_many :borrower_purchases

  def credit_used
    self.borrower_purchases.inject(0) do |sum, purchase|
      sum + purchase.amount
    end
  end

end
