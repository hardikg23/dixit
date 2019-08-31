class AddDeleteColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :state, :integer, default: 1
    add_column :payments, :state, :integer, default: 1
    add_column :purchases, :state, :integer, default: 1
  end
end
