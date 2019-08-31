class ConvertIntToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :sales, :amount, :float
    change_column :sales, :conversion_rate, :float
    change_column :sales, :total_received, :float

    change_column :purchases, :amount, :float
    change_column :purchases, :conversion_rate, :float
    change_column :purchases, :total_paid, :float
  end
end
