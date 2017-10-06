class CreateBorrowersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.bigint :phone_number
      t.string :email
      t.string :address
      t.boolean :approved,  :default => false
      t.timestamp
    end
  end
end
