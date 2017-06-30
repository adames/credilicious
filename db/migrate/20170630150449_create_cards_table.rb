class CreateCardsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :borrower_id
      t.integer :transaction_id
      t.boolean :active, :default => true
      t.timestamp
    end
  end
end
