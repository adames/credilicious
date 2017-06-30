class CreateTransactionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :seller
      t.timestamp
    end
  end
end
