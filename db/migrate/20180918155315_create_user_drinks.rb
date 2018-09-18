class CreateUserDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_drinks do |t|
      t.references :user, foreign_key: true
      t.references :drink, foreign_key: true

      t.timestamps
    end
  end
end
