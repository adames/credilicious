class CreatePayrollCompaniesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :payroll_companies do |t|
      t.string :name
    end
  end
end
