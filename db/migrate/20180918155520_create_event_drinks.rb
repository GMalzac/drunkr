class CreateEventDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :event_drinks do |t|
      t.references :event, foreign_key: true
      t.references :drink, foreign_key: true

      t.timestamps
    end
  end
end
