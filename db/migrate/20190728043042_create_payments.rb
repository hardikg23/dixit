class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :entity_id, null: false
      
      t.integer :paymentable_id
      t.integer :paymentable_type     

      t.string :description

      t.integer :amount, null: false
      t.string :from_person
      t.string :to_person

      t.integer :payment_type, null: false
      t.datetime :payment_date

      t.timestamps
    end
  end
end
