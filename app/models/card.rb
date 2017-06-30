class Card < ActiveRecord::Base
  belongs_to :borrower
  has_many :transactions
  


end
