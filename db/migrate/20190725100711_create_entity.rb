class CreateEntity < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :mobile
      t.text :address
      t.string :company_name

      t.timestamps
    end
  end
end
