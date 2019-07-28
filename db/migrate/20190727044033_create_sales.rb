class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :entity_id, null: false

      t.integer :sale_type, null: false
      t.string :description
      t.string :broker_name

      t.float :quantity, null: false
      t.float :return_quantity
      t.float :final_quantity

      t.integer :amount, null: false
      t.integer :amount_type, null: false
      t.integer :conversion_rate

      t.integer :payment_type, null: false
      t.datetime :payment_date

      t.integer :terms

      t.timestamps
    end
  end
end
