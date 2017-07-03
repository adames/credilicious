class EmploymentHistory < ActiveRecord::Base
  belongs_to :employer
  belongs_to :borrower
end
