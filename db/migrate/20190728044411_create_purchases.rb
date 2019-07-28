class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :entity_id

      t.integer :sale_type, null: false
      t.string :description

      t.float :quantity

      t.integer :amount, null: false
      t.integer :amount_type, null: false
      t.integer :conversion_rate

      t.integer :payment_type, null: false
      t.datetime :payment_date
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
