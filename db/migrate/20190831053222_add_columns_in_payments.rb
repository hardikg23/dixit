class AddColumnsInPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :amount_type, :integer
    add_column :payments, :conversion_rate, :float
  end
end
