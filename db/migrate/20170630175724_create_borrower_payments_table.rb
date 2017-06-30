class CreateBorrowerPaymentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :borrower_payments do |t|
      t.float :amount
      t.integer :borrower_id
      t.timestamp
    end
  end
end
