class EmploymentHistory < ActiveRecord::Base
  belongs_to :employer
  belongs_to :borrower

  validate :start_date_before_end_date

  def start_date_before_end_date
    if start_date > end_date || (end_date.nil? && !start_date.nil?)
      errors.add(:start_date, "is after end date")
    end
  end

end
