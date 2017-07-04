# == Schema Information
#
# Table name: employers
#
#  id                 :integer          not null, primary key
#  name               :string
#  payroll_company_id :integer
#

class Employer < ActiveRecord::Base
  has_one :payroll_company
  has_many :employment_histories
  has_many :borrowers, :through => :employment_histories
end
