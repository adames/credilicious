class CreateBorrowerPurchasesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :borrower_purchases do |t|
      t.float   :amount
      t.string  :seller
      t.integer :card_id
      t.timestamp
    end
  end
end
