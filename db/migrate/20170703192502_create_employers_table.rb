class CreateEmployersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
      t.string  :name
      t.integer :payroll_company_id
    end
  end
end
