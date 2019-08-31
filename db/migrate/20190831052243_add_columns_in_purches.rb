class AddColumnsInPurches < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :per_carat_rate, :float
  end
end
