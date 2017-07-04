# == Schema Information
#
# Table name: payroll_companies
#
#  id   :integer          not null, primary key
#  name :string
#

class PayrollCompany < ActiveRecord::Base
  has_many :employers
  has_many :employment_histories, through: :employers
  has_many :borrowers, through: :employment_histories
end
