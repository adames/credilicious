class Borrower < ActiveRecord::Base
  has_one :card
  has_many :transactions, :through => :card


end
