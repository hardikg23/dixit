class AddColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :amount, :float

    add_column :sales, :invoice_number, :string
    add_column :purchases, :invoice_number, :string
  end
end
