class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.float :volume
      t.float :alcohol_rate
      t.float :alcohol
      t.string :photo

      t.timestamps
    end
  end
end
