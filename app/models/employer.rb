class Employer < ActiveRecord::Base
  has_one :payroll_company
  has_many :employment_histories
  has_many :borrowers, through: => :employment_history
end
