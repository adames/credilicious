# == Schema Information
#
# Table name: borrower_payments
#
#  id          :integer          not null, primary key
#  amount      :float
#  borrower_id :integer
#

class BorrowerPayment < ActiveRecord::Base
  belongs_to :borrower
end
