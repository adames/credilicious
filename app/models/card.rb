# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  borrower_id :integer
#  credit_line :integer
#  active      :boolean          default(TRUE)
#

class Card < ActiveRecord::Base
  belongs_to :borrower
  has_many :borrower_purchases

  def credit_used
    self.borrower_purchases.inject(0) do |sum, purchase|
      sum + purchase.amount
    end
  end

  def self.default_card
    Card.create(credit_line:1000)
  end

end
